//
//  OnlineDictionary.swift
//  English
//
//  Created by Сергей Гаврилко on 08/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import CSV
import UIKit
import Alamofire
import CoreData

infix operator >>> : BitwiseShiftPrecedence

func >>> (lhs: Int32, rhs: Int32) -> Int32 {
    return Int32(bitPattern: UInt32(bitPattern: lhs) >> UInt32(rhs))
}

extension StringProtocol {
    var ascii: [UInt32] {
        return unicodeScalars.compactMap { $0.value }
    }
}

protocol OnlineDictionaryDelegate {
    func didFinishTranslate(_ word: Word)
}

class OnlineDictionary: NSObject {
    
    var TKK = "426699.3142874640"
    var delegate: OnlineDictionaryDelegate!
    var csv: CSVReader!
    
    func getTk(_ text: String) {
        let language = detectLanguage(text: text)
        updateTKK(text, language: language)
    }
    
    func translate(_ text: String, language: String, tk: String) {
        let str = text.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        var from = Language.en
        var to = Language.ru
        
        if language == Language.ru {
            from = Language.ru
            to = Language.en
        }
        
        let requestManager = Alamofire.SessionManager.default
        requestManager.session.configuration.timeoutIntervalForRequest = 10
        
        requestManager.request("https://translate.google.com/translate_a/single?client=t&sl=\(from)&tl=\(to)&hl=\(to)&dt=at&dt=bd&dt=ex&dt=ld&dt=md&dt=qca&dt=rw&dt=rm&dt=ss&dt=t&ie=UTF-8&oe=UTF-8&otf=1&ssel=0&tsel=0&kc=7&q=\(str)&tk=\(tk)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseString { response in
            
            switch response.result {
            case .success:
                var dictionary: [AnyObject] = []
                if let d = response.result.value!.data(using: String.Encoding.utf8) {
                    do {
                        dictionary = (try JSONSerialization.jsonObject(with: d, options: []) as? [AnyObject])!
                    } catch let error as NSError {
                        print(error)
                        self.delegate.didFinishTranslate(Word(original: text))
                        return
                    }
                }
                
                let data = dictionary
                guard let main = data[0] as? [AnyObject] else { return }
                
                guard let translateItem = main[0] as? [AnyObject] else {
                    print("Слово не найдено")
                    self.delegate.didFinishTranslate(Word(original: text))
                    return
                }
                guard let translate = translateItem[0] as? String else {
                    print("Слово не найдено")
                    self.delegate.didFinishTranslate(Word(original: text))
                    return
                }
                
                let trs = self.getTranslates(data)
                
                let word = Word(
                    original: text,
                    translate: translate,
                    translates: trs
                )
                
                self.delegate.didFinishTranslate(word)
                
            case .failure(let error):
                print("ERROR: \(text), \(tk)")
                self.delegate.didFinishTranslate(Word(original: text))
                print(error)
            }
            
        }
        
    }
    
    func getTranslates(_ data: [AnyObject]) -> [Translate] {
        guard let others = data[1] as? [AnyObject] else {
            return []
        }
        
        var trs: [Translate] = []
        
        for other in others {
            guard let array = other as? [AnyObject] else {
                return trs
            }
            guard let pos = array[0] as? String else {
                return trs
            }
            guard let translations = array[1] as? [String] else {
                return trs
            }
            
            let translate = Translate()
            translate.pos = self.parse(pos: pos)
            translate.trs = Array(translations.prefix(3))
            trs.append(translate)
        }
        
        return trs
    }
    
    func updateTKK(_ text: String, language: String) {
        let requestManager = Alamofire.SessionManager.default
        requestManager.session.configuration.timeoutIntervalForRequest = 50
        requestManager.request("https://translate.google.com").responseString { response in
            
            switch response.result {
            case .success:
                let reg = "TKK=\'[0-9\\.\\-]+\'"
                let code = self.matches(for: reg, in: response.result.value!)
                var tk = ""
                
                if !code.isEmpty {
                    tk = self.parse(code[0])
                    self.TKK = tk
                }
                
                tk = self.sM(text)
                self.translate(text, language: language, tk: tk)
                
            case .failure(let error):
                self.delegate.didFinishTranslate(Word(original: text))
                print(error)
            }
            
        }
    }
    
    func matches(for regex: String, in text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
            
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    func parse(_ text: String) -> String {
        let reg = "[0-9\\-]+"
        let values = self.matches(for: reg, in: text)
        return values[0] + "." + values[1]
    }
    
    func sM(_ a: String) -> String {
        let d = TKK.components(separatedBy: ".")
        let b = Int(d[0])!
        var e: [Int] = []
        var g = -1
        for _ in 0..<a.count {
            g += 1
            if g >= a.count { break }
            var l = Int(a.ascii[g])
            if 128 > l {
                e.append(l)
            } else {
                if 2048 > l {
                    e.append(Int(Int32(truncatingIfNeeded: l) >> Int32(truncatingIfNeeded: 6) | Int32(truncatingIfNeeded: 192)))
                } else {
                    if 55296 == (Int32(truncatingIfNeeded: l) & Int32(truncatingIfNeeded: 64512)) && (g + 1 < a.count) && 56320 == Int(Int32(truncatingIfNeeded: (a.ascii[g+1])) & 64512) {
                        g += 1
                        l = 65536 + Int((Int32(truncatingIfNeeded: l) & 1023) << 10) + Int(Int32(truncatingIfNeeded: a.ascii[g]) & 1023)
                        e.append(Int(Int32(truncatingIfNeeded: l) >> 18 | 240))
                        e.append(Int(Int32(truncatingIfNeeded: l) >> 12 & 63 | 128))
                    } else {
                        e.append(Int(Int32(truncatingIfNeeded: l) >> 12 | 224))
                        e.append(Int(Int32(truncatingIfNeeded: l) >> 6 & 63 | 128))
                    }
                }
                e.append(Int(Int32(truncatingIfNeeded: l) & 63 | 128))
            }
        }
        var b_a = b
        for i in e {
            b_a += i
            b_a = xr(b_a, "+-a^+6")
        }
        b_a = xr(b_a, "+-3^+b+-f")
        b_a = Int(Int32(truncatingIfNeeded: b_a) ^ Int32(truncatingIfNeeded: Int(d[1])!))
        if 0 > b_a {
            b_a = Int(Int32(truncatingIfNeeded: b_a) & Int32(truncatingIfNeeded: 2147483647)) + 2147483648
        }
        b_a %= Int(1E6)
        return "\(b_a).\(Int(Int32(truncatingIfNeeded: b_a) ^ Int32(truncatingIfNeeded: b)))"
    }
    
    func xr(_ a: Int, _ b: String) -> Int {
        var c = 0
        var a_int: Int = a
        for _ in 0..<(b.count - 2) {
            if c >= b.count - 2 { break }
            let d = b[b.index(b.startIndex, offsetBy: c + 2)]
            var d_int: Int = 0
            if "a" <= d {
                d_int = Int(d.unicodeScalarCodePoint()) - 87
            } else {
                d_int = Int(String(d))!
            }
            if "+" == b[b.index(b.startIndex, offsetBy: c + 1)] {
                d_int = Int(Int32(truncatingIfNeeded: a_int) >>> Int32(truncatingIfNeeded: d_int))
            } else {
                d_int = Int(Int32(truncatingIfNeeded: a_int) << Int32(truncatingIfNeeded: d_int))
            }
            if "+" == b[b.index(b.startIndex, offsetBy: c)] {
                a_int = Int(Int32(truncatingIfNeeded: a_int + d_int) & Int32(truncatingIfNeeded: 4294967295))
            } else {
                a_int = Int(Int32(truncatingIfNeeded: a_int) ^ Int32(truncatingIfNeeded: d_int))
            }
            c += 3
        }
        return a_int
    }
    
    func detectLanguage(text: String) -> String {
        if let c = text.lowercased().first {
            return c.detectLanguage()
        }
        return Language.en
    }
    
    func parse(pos: String) -> String {
        switch pos {
        case "наречие": return "нар."
        case "имя существительное": return "сущ."
        case "имя прилагательное": return "прил."
        case "глагол": return "гл."
        case "местоимение": return "мест."
        case "предлог": return "пред."
        case "союз": return "союз"
        case "частица": return "част."
        case "сокращение": return "сокр."
        case "abbreviatio": return "аббр."
        default: return pos
        }
    }
    
}

