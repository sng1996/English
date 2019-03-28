//
//  ThemesService.swift
//  English
//
//  Created by Сергей Гаврилко on 25/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ThemesService: ServiceProvider {

//    var data: [Theme] = [
//        Theme(filename: "BasicConcepts", name: "Основные понятия", subthemes: [
//            Theme(filename: "PartsOfSpeech", name: "Части речи", subthemes: [
//                Theme(filename: "Pronouns", name: "Местоимения"),
//                Theme(filename: "VerbsPart1", name: "Глаголы. Часть 1"),
//                Theme(filename: "VerbsPart2", name: "Глаголы. Часть 2"),
//                Theme(filename: "VerbsPart3", name: "Глаголы. Часть 3"),
//                Theme(filename: "VerbsPart4", name: "Глаголы. Часть 4"),
//                Theme(filename: "AdverbsPart1", name: "Наречия. Часть 1"),
//                Theme(filename: "AdverbsPart2", name: "Наречия. Часть 2"),
//                Theme(filename: "AdverbsPart3", name: "Наречия. Часть 3"),
//                Theme(filename: "Prepositions", name: "Предлоги"),
//                Theme(filename: "Numbers", name: "Числа"),
//                Theme(filename: "OrdinalNumbers", name: "Порядковые числа"),
//                Theme(filename: "FractionalNumbers", name: "Дробные числа")
//            ]),
//            Theme(filename: "Time", name: "Временные отрезки", subthemes: [
//                Theme(filename: "MainTime", name: "Основное"),
//                Theme(filename: "DaysOfTheWeek", name: "Дни недели"),
//                Theme(filename: "TimesOfDay", name: "Время суток"),
//                Theme(filename: "Seasons", name: "Времена года")
//            ]),
//            Theme(filename: "MainConcepts", name: "Общие понятия", subthemes: [
//                Theme(filename: "Colors", name: "Цвета"),
//                Theme(filename: "OppositesPart1", name: "Противоположности. Часть 1"),
//                Theme(filename: "OppositesPart2", name: "Противоположности. Часть 2")
//            ])
//        ]),
//        Theme(filename: "Man", name: "Человек", subthemes: [
//            Theme(filename: "BodyMain", name: "Тело", subthemes: [
//                Theme(filename: "MainBody", name: "Основное"),
//                Theme(filename: "Anatomy", name: "Анатомия"),
//                Theme(filename: "Head", name: "Голова"),
//                Theme(filename: "Body", name: "Тело")
//            ]),
//            Theme(filename: "Wardrobe", name: "Гардероб", subthemes: [
//                Theme(filename: "Outerwear", name: "Верхняя одежда"),
//                Theme(filename: "Clothes", name: "Одежда"),
//                Theme(filename: "Underwear", name: "Бельё"),
//                Theme(filename: "Headdress", name: "Головной убор"),
//                Theme(filename: "Shoes", name: "Обувь"),
//                Theme(filename: "Accessories", name: "Аксессуары"),
//                Theme(filename: "Cosmetics", name: "Гигиена и косметика"),
//                Theme(filename: "Jewelry", name: "Драгоценности"),
//                Theme(filename: "Clock", name: "Часы"),
//                Theme(filename: "Fabrics", name: "Ткани"),
//                Theme(filename: "Sundry", name: "Разное")
//            ]),
//            Theme(filename: "Food", name: "Питание", subthemes: [
//                Theme(filename: "ProductsPart1", name: "Продукты. Часть 1"),
//                Theme(filename: "ProductsPart2", name: "Продукты. Часть 2"),
//                Theme(filename: "Drinks", name: "Напитки"),
//                Theme(filename: "Vegetables", name: "Овощи"),
//                Theme(filename: "FriutsAndNuts", name: "Фрукты и орехи"),
//                Theme(filename: "Candies", name: "Кондитерские изделия"),
//                Theme(filename: "Dishes", name: "Блюда"),
//                Theme(filename: "Condiment", name: "Приправы"),
//                Theme(filename: "Meal", name: "Прием пищи"),
//                Theme(filename: "TableSetting", name: "Сервировка стола"),
//                Theme(filename: "Restaurant", name: "Ресторан")
//            ]),
//            Theme(filename: "SurroundingPeople", name: "Окружение", subthemes: [
//                Theme(filename: "Profile", name: "Анкетные данные"),
//                Theme(filename: "Family", name: "Семья"),
//                Theme(filename: "FriendsAndColleagues", name: "Друзья и коллеги"),
//                Theme(filename: "DescriptionOfPeople", name: "Описание человека"),
//                Theme(filename: "Age", name: "Возраст"),
//                Theme(filename: "Child", name: "Ребёнок"),
//                Theme(filename: "Marrieds", name: "Супруги")
//            ]),
//            Theme(filename: "Communication", name: "Коммуникация", subthemes: [
//                Theme(filename: "TalkPart1", name: "Разговор. Часть 1"),
//                Theme(filename: "TalkPart2", name: "Разговор. Часть 2"),
//                Theme(filename: "TalkPart3", name: "Разговор. Часть 3"),
//                Theme(filename: "Reaction", name: "Реакция"),
//                Theme(filename: "PhrasesForCommunication", name: "Фразы для общения"),
//                Theme(filename: "Appeal", name: "Обращения"),
//                Theme(filename: "Questions", name: "Вопросы")
//            ]),
//            Theme(filename: "Psychology", name: "Психология", subthemes: [
//                Theme(filename: "HumanCondition", name: "Состояние человека"),
//                Theme(filename: "CharacterPart1", name: "Черты характера. Часть 1"),
//                Theme(filename: "CharacterPart2", name: "Черты характера. Часть 2"),
//                Theme(filename: "Sleep", name: "Сон"),
//                Theme(filename: "Humor", name: "Юмор"),
//                Theme(filename: "Success", name: "Успех"),
//                Theme(filename: "QuarrelPart1", name: "Ссора. Часть 1"),
//                Theme(filename: "QuarrelPart2", name: "Ссора. Часть 2")
//            ]),
//            Theme(filename: "Medicine", name: "Медицина", subthemes: [
//                Theme(filename: "DiseasesPart1", name: "Болезни. Часть 1"),
//                Theme(filename: "DiseasesPart2", name: "Болезни. Часть 2"),
//                Theme(filename: "SymptomsPart1", name: "Симптомы и лечение. Часть 1"),
//                Theme(filename: "SymptomsPart2", name: "Симптомы и лечение. Часть 2"),
//                Theme(filename: "SymptomsPart3", name: "Симптомы и лечение. Часть 3"),
//                Theme(filename: "Doctors", name: "Врачи"),
//                Theme(filename: "FirstAidKit", name: "Аптечка")
//            ]),
//        ]),
//        Theme(filename: "MainHabitat", name: "Среда обитания", subthemes: [
//            Theme(filename: "City", name: "Город", subthemes: [
//                Theme(filename: "LifeInCityPart1", name: "Жизнь в городе. Часть 1"),
//                Theme(filename: "LifeInCityPart2", name: "Жизнь в городе. Часть 2"),
//                Theme(filename: "CityInstitutionsPart1", name: "Городские учреждения. Часть 1"),
//                Theme(filename: "CityInstitutionsPart2", name: "Городские учреждения. Часть 2"),
//                Theme(filename: "Signage", name: "Вывески и указатели"),
//                Theme(filename: "CityTransport", name: "Транспорт"),
//                Theme(filename: "Lions", name: "Достопримечательности"),
//                Theme(filename: "Shopping", name: "Шоппинг"),
//                Theme(filename: "Money", name: "Деньги"),
//                Theme(filename: "PostOffice", name: "Почта")
//            ]),
//            Theme(filename: "Dwelling", name: "Жилище", subthemes: [
//                Theme(filename: "Home", name: "Дом"),
//                Theme(filename: "Porch", name: "Подъезд"),
//                Theme(filename: "Electricity", name: "Электричество"),
//                Theme(filename: "Door", name: "Дверь"),
//                Theme(filename: "HouseInTheVillage", name: "Дом в деревне"),
//                Theme(filename: "Mansion", name: "Особняк"),
//                Theme(filename: "Palace", name: "Дворец"),
//                Theme(filename: "Apartment", name: "Квартира"),
//                Theme(filename: "Cleaning", name: "Уборка"),
//                Theme(filename: "Interior", name: "Интерьер"),
//                Theme(filename: "BedLinen", name: "Постельные принадлежности"),
//                Theme(filename: "Kitchen", name: "Кухня"),
//                Theme(filename: "Bathroom", name: "Ванная комната"),
//                Theme(filename: "Appliances", name: "Бытовая техника"),
//                Theme(filename: "Repairs", name: "Ремонт"),
//                Theme(filename: "Plumbind", name: "Сантехника"),
//                Theme(filename: "Fire", name: "Пожар")
//            ])
//        ]),
//        Theme(filename: "Activity", name: "Деятельность", subthemes: [
//            Theme(filename: "Job", name: "Работа", subthemes: [
//                Theme(filename: "Office", name: "Офис"),
//                Theme(filename: "BusinessPart1", name: "Бизнес процессы. Часть 1"),
//                Theme(filename: "BusinessPart2", name: "Бизнес процессы. Часть 2"),
//                Theme(filename: "FactoryPart1", name: "Производство. Часть 1"),
//                Theme(filename: "FactoryPart2", name: "Производство. Часть 2"),
//                Theme(filename: "Contract", name: "Контракт"),
//                Theme(filename: "Import", name: "Импорт и экспорт"),
//                Theme(filename: "Finance", name: "Финансы"),
//                Theme(filename: "Marketing", name: "Маркетинг"),
//                Theme(filename: "Advertising", name: "Реклама"),
//                Theme(filename: "Bank", name: "Банк"),
//                Theme(filename: "Telephone", name: "Телефон"),
//                Theme(filename: "Phone", name: "Мобильный телефон"),
//                Theme(filename: "Chancellery", name: "Канцелярия"),
//                Theme(filename: "Documents", name: "Документы"),
//                Theme(filename: "BranchesPart1", name: "Отрасли. Часть 1"),
//                Theme(filename: "BranchesPart2", name: "Отрасли. Часть 2"),
//                Theme(filename: "Exhibition", name: "Выставка"),
//                Theme(filename: "MassMedia", name: "СМИ"),
//                Theme(filename: "Agriculture", name: "Сельское хозяйство"),
//                Theme(filename: "Building", name: "Стройка"),
//                Theme(filename: "Science", name: "Наука")
//            ]),
//            Theme(filename: "Profession", name: "Профессии", subthemes: [
//                Theme(filename: "SearchJob", name: "Поиск работы"),
//                Theme(filename: "PeopleInBusiness", name: "Люди в среде бизнеса"),
//                Theme(filename: "ServicesSector", name: "Профессии в сфере услуг"),
//                Theme(filename: "Military", name: "Военные"),
//                Theme(filename: "State", name: "Государственные служащие"),
//                Theme(filename: "ProfessionAgriculture", name: "Профессии в сельском хозяйстве"),
//                Theme(filename: "ProfessionArts", name: "Профессии в области искусства"),
//                Theme(filename: "SocialStatus", name: "Социальное положение"),
//                Theme(filename: "ProfessionSundryPart1", name: "Разное. Часть 1"),
//                Theme(filename: "ProfessionSundryPart2", name: "Разное. Часть 2")
//            ]),
//            Theme(filename: "Sport", name: "Спорт", subthemes: [
//                Theme(filename: "KindOfSports", name: "Виды спорта"),
//                Theme(filename: "Gym", name: "Спортивный зал"),
//                Theme(filename: "Hockey", name: "Хоккей"),
//                Theme(filename: "FootballPart1", name: "Футбол. Часть 1"),
//                Theme(filename: "FootballPart2", name: "Футбол. Часть 2"),
//                Theme(filename: "Ski", name: "Горные лыжи"),
//                Theme(filename: "Tennis", name: "Теннис и гольф"),
//                Theme(filename: "Chess", name: "Шахматы"),
//                Theme(filename: "Boxing", name: "Бокс"),
//                Theme(filename: "HorseRiding", name: "Конный спорт"),
//                Theme(filename: "SportSundryPart1", name: "Разное. Часть 1"),
//                Theme(filename: "SportSundryPart2", name: "Разное. Часть 2")
//            ]),
//            Theme(filename: "Education", name: "Образование", subthemes: [
//                Theme(filename: "SchoolPart1", name: "Школа. Часть 1"),
//                Theme(filename: "SchoolPart2", name: "Школа. Часть 2"),
//                Theme(filename: "University", name: "Вуз"),
//                Theme(filename: "EducationScience", name: "Науки"),
//                Theme(filename: "LetterPart1", name: "Письмо. Часть 1"),
//                Theme(filename: "LetterPart2", name: "Письмо. Часть 2"),
//                Theme(filename: "Language", name: "Иностранные языки"),
//                Theme(filename: "FairyCharacters", name: "Сказочные персонажи")
//            ]),
//            Theme(filename: "NaturalSciences", name: "Естественные науки", subthemes: [
//                Theme(filename: "Algebra", name: "Алгебра"),
//                Theme(filename: "Geometry", name: "Геометрия"),
//                Theme(filename: "Measurements", name: "Меры измерения"),
//                Theme(filename: "Capacity", name: "Ёмкости"),
//                Theme(filename: "Materials", name: "Материалы"),
//                Theme(filename: "Metals", name: "Металлы")
//            ]),
//            Theme(filename: "History", name: "История", subthemes: [
//                Theme(filename: "PrimitivePeople", name: "Первобытные люди"),
//                Theme(filename: "MiddleAgesPart1", name: "Средние века. Часть 1"),
//                Theme(filename: "MiddleAgesPart2", name: "Средние века. Часть 2"),
//                Theme(filename: "Ruler", name: "Правитель")
//            ]),
//            Theme(filename: "Jurisprudence", name: "Юриспруденция", subthemes: [
//                Theme(filename: "CriminalPart1", name: "Преступник. Часть 1"),
//                Theme(filename: "CriminalPart2", name: "Преступник. Часть 2"),
//                Theme(filename: "LawPart1", name: "Закон. Часть 1"),
//                Theme(filename: "LawPart2", name: "Закон. Часть 2")
//            ]),
//            Theme(filename: "ArtSkill", name: "Искусство", subthemes: [
//                Theme(filename: "Theatre", name: "Театр"),
//                Theme(filename: "Cinema", name: "Кино"),
//                Theme(filename: "Art", name: "Изобразительное искусство"),
//                Theme(filename: "Literature", name: "Литература и поэзия"),
//                Theme(filename: "Circus", name: "Цирк"),
//                Theme(filename: "Music", name: "Музыка")
//            ]),
//            Theme(filename: "Rest", name: "Отдых", subthemes: [
//                Theme(filename: "Tour", name: "Турпоездка"),
//                Theme(filename: "Road", name: "Дорога"),
//                Theme(filename: "Hotel", name: "Гостиница"),
//                Theme(filename: "BookPart1", name: "Книга. Часть 1"),
//                Theme(filename: "BookPart2", name: "Книга. Часть 2"),
//                Theme(filename: "Hunt", name: "Охота и рыбалка"),
//                Theme(filename: "Billiards", name: "Бильярд"),
//                Theme(filename: "Cards", name: "Карты"),
//                Theme(filename: "Casino", name: "Казино"),
//                Theme(filename: "Photo", name: "Фотография"),
//                Theme(filename: "Beach", name: "Пляж"),
//                Theme(filename: "RestSundry", name: "Разное")
//            ])
//        ]),
//        Theme(filename: "MainTechnique", name: "Техника", subthemes: [
//            Theme(filename: "Technique", name: "Техника", subthemes: [
//                Theme(filename: "Computer", name: "Компьютер"),
//                Theme(filename: "Internet", name: "Интернет"),
//                Theme(filename: "TechniqueElectricity", name: "Электричество"),
//                Theme(filename: "ToolsPart1", name: "Инструменты. Часть 1"),
//                Theme(filename: "ToolsPart2", name: "Инструменты. Часть 2")
//            ]),
//            Theme(filename: "Transport", name: "Транспорт", subthemes: [
//                Theme(filename: "Plane", name: "Самолёт"),
//                Theme(filename: "Train", name: "Поезд"),
//                Theme(filename: "ShipPart1", name: "Корабль. Часть 1"),
//                Theme(filename: "ShipPart2", name: "Корабль. Часть 2"),
//                Theme(filename: "Airport", name: "Аэропорт"),
//                Theme(filename: "Bycycle", name: "Велосипед и мотоцикл")
//            ]),
//            Theme(filename: "Car", name: "Автомобиль", subthemes: [
//                Theme(filename: "CarKinds", name: "Виды"),
//                Theme(filename: "CarBodyPart1", name: "Кузов. Часть 1"),
//                Theme(filename: "CarBodyPart2", name: "Кузов. Часть 2"),
//                Theme(filename: "Salon", name: "Салон"),
//                Theme(filename: "Engine", name: "Двигатель"),
//                Theme(filename: "Crash", name: "Авария и ремонт"),
//                Theme(filename: "CarRoad", name: "Дорога"),
//                Theme(filename: "RoadSigns", name: "Дорожные знаки")
//            ])
//        ]),
//        Theme(filename: "MainEvents", name: "События", subthemes: [
//            Theme(filename: "Events", name: "События", subthemes: [
//                Theme(filename: "Holiday", name: "Праздник"),
//                Theme(filename: "Funeral", name: "Похороны")
//            ]),
//            Theme(filename: "War", name: "Война", subthemes: [
//                Theme(filename: "WarPeople", name: "Люди"),
//                Theme(filename: "HostilitiesPart1", name: "Военные действия. Часть 1"),
//                Theme(filename: "HostilitiesPart2", name: "Военные действия. Часть 2"),
//                Theme(filename: "HostilitiesPart3", name: "Военные действия. Часть 3"),
//                Theme(filename: "WeaponsPart1", name: "Оружие. Часть 1"),
//                Theme(filename: "WeaponsPart2", name: "Оружие. Часть 2")
//            ])
//        ]),
//        Theme(filename: "Nature", name: "Природа", subthemes: [
//            Theme(filename: "Planet", name: "Планета", subthemes: [
//                Theme(filename: "SpacePart1", name: "Космос. Часть 1"),
//                Theme(filename: "SpacePart2", name: "Космос. Часть 2"),
//                Theme(filename: "Earth", name: "Земля"),
//                Theme(filename: "PartsOfTheWorld", name: "Части света"),
//                Theme(filename: "OceanPart1", name: "Море и океан. Часть 1"),
//                Theme(filename: "OceanPart2", name: "Море и океан. Часть 2"),
//                Theme(filename: "Mountains", name: "Горы"),
//                Theme(filename: "River", name: "Река"),
//                Theme(filename: "Forest", name: "Лес"),
//                Theme(filename: "Resources", name: "Природные ресурсы"),
//                Theme(filename: "Weather", name: "Погода"),
//                Theme(filename: "Element", name: "Стихия"),
//                Theme(filename: "NatureSounds", name: "Шумы и звуки"),
//                Theme(filename: "Winter", name: "Зима")
//            ]),
//            Theme(filename: "Fauna", name: "Фауна", subthemes: [
//                Theme(filename: "Mammals", name: "Млекопитающие и хищники"),
//                Theme(filename: "WildAnimalsPart1", name: "Дикие животные. Часть 1"),
//                Theme(filename: "WildAnimalsPart2", name: "Дикие животные. Часть 2"),
//                Theme(filename: "DomesticAnimals", name: "Домашние животные"),
//                Theme(filename: "Dog", name: "Собака"),
//                Theme(filename: "AnimalSounds", name: "Звуки животных"),
//                Theme(filename: "BabyAnimals", name: "Детёныши животных"),
//                Theme(filename: "Birds", name: "Птицы"),
//                Theme(filename: "BirdsSounds", name: "Звуки птиц"),
//                Theme(filename: "Fish", name: "Рыбы и морские животные"),
//                Theme(filename: "Amphibians", name: "Земноводные и пресмыкающиеся"),
//                Theme(filename: "Insects", name: "Насекомые и беспозвоночные"),
//                Theme(filename: "AnimalBody", name: "Части тела"),
//                Theme(filename: "AnimalActivity", name: "Действия животных"),
//                Theme(filename: "Habitat", name: "Среда обитания"),
//                Theme(filename: "AnimalCare", name: "Уход за животными"),
//                Theme(filename: "AnimalSundry", name: "Разное")
//            ]),
//            Theme(filename: "Flora", name: "Флора", subthemes: [
//                Theme(filename: "Trees", name: "Деревья"),
//                Theme(filename: "Shrubs", name: "Кустарники"),
//                Theme(filename: "Mushrooms", name: "Грибы"),
//                Theme(filename: "Fruits", name: "Фрукты и ягоды"),
//                Theme(filename: "FloraVegetables", name: "Овощи и зелень"),
//                Theme(filename: "FlowersPart1", name: "Цветы и растения. Часть 1"),
//                Theme(filename: "FlowersPart2", name: "Цветы и растения. Часть 2"),
//                Theme(filename: "Cereals", name: "Зерновые")
//            ])
//        ]),
//        Theme(filename: "Geography", name: "Страноведение", subthemes: [
//            Theme(filename: "Country", name: "Страны", subthemes: [
//                Theme(filename: "WestEuropePart1", name: "Западная Европа. Часть 1"),
//                Theme(filename: "WestEuropePart2", name: "Западная Европа. Часть 2"),
//                Theme(filename: "EastEurope", name: "Центральная и Восточная Европа"),
//                Theme(filename: "SNG", name: "Страны СНГ"),
//                Theme(filename: "Asia", name: "Азия"),
//                Theme(filename: "NorthAmerica", name: "Северная Америка"),
//                Theme(filename: "SouthAmerica", name: "Центральная и Южная Америка"),
//                Theme(filename: "Africa", name: "Африка"),
//                Theme(filename: "Australia", name: "Австралия и Океания"),
//                Theme(filename: "GeographyCityPart1", name: "Города. Часть 1"),
//                Theme(filename: "GeographyCityPart2", name: "Города. Часть 2"),
//                Theme(filename: "GovernmentPart1", name: "Правительство. Часть 1"),
//                Theme(filename: "GovernmentPart2", name: "Правительство. Часть 2"),
//                Theme(filename: "GeographySundry", name: "Разное")
//            ]),
//            Theme(filename: "Religion", name: "Религия", subthemes: [
//                Theme(filename: "WorldReligions", name: "Мировые религии"),
//                Theme(filename: "ReligionPeople", name: "Люди"),
//                Theme(filename: "ChristianityIslamPart1", name: "Христианство и Ислам. Часть 1"),
//                Theme(filename: "ChristianityIslamPart2", name: "Христианство и Ислам. Часть 2")
//            ])
//        ])
//    ]
    
    var data: [Theme] = [
        Theme(filename: "MainPartsOfSpeech", name: "Основные части речи", subthemes: [
            Theme(filename: "Pronouns", name: "Местоимения"),
            Theme(filename: "Verbs", name: "Глаголы"),
            Theme(filename: "Adverbs", name: "Наречия"),
            Theme(filename: "Numbers", name: "Числа"),
            Theme(filename: "Prepositions", name: "Предлоги"),
            Theme(filename: "Opposites", name: "Противоположности"),
        ]),
        Theme(filename: "BasicConcepts", name: "Основные понятия", subthemes: [
            Theme(filename: "Colors", name: "Цвета"),
            Theme(filename: "Calendar", name: "Календарь"),
            Theme(filename: "Time", name: "Время"),
            Theme(filename: "Profile", name: "Анкетные данные"),
        ]),
        Theme(filename: "Human", name: "Человек", subthemes: [
            Theme(filename: "Body", name: "Тело"),
            Theme(filename: "Clothes", name: "Одежда"),
            Theme(filename: "Family", name: "Семья"),
            Theme(filename: "HumanCondition", name: "Состояние человека"),
            Theme(filename: "Character", name: "Черты характера"),
        ]),
        Theme(filename: "Nutrition", name: "Питание", subthemes: [
            Theme(filename: "Meal", name: "Приём пищи"),
            Theme(filename: "Products", name: "Продукты"),
            Theme(filename: "Drinks", name: "Напитки"),
            Theme(filename: "VegetablesAndFruits", name: "Овощи и фрукты"),
            Theme(filename: "DishesAndCondiment", name: "Блюда и приправы"),
            Theme(filename: "Restaurant", name: "Ресторан"),
        ]),
        Theme(filename: "Work", name: "Работа", subthemes: [
            Theme(filename: "Business", name: "Бизнес процессы"),
            Theme(filename: "Deal", name: "Сделка"),
            Theme(filename: "Marketing", name: "Маркетинг"),
            Theme(filename: "Finance", name: "Финансы"),
            Theme(filename: "Exhibition", name: "Выставка"),
            Theme(filename: "Science", name: "Наука"),
            Theme(filename: "Office", name: "Офис"),
        ]),
    ]

    
    init() { }
    
    func loadDataFromFiles() {
        if ThemeWordDataManager().getAllWordsCountFromCoreData(theme: data[0].subthemes[0]) == 0 {
            let csvManager = CSVManager()
            for theme1 in data {
                for theme2 in theme1.subthemes {
                    csvManager.writeWordsFromCSVToCoreData(theme: theme2)
                }
            }
        }
        coreDataService.saveContext()
        loadCountData()
    }

    //  Делаем пересчет всех слов
    func loadCountData() {
        let manager = ThemeWordDataManager()

        for theme1 in data {
            theme1.countArchive = 0
            theme1.countAll = 0
            for theme2 in theme1.subthemes {
                theme2.countArchive = manager.getArchiveWordsCountFromCoreData(theme: theme2)
                theme2.countAll = manager.getAllWordsCountFromCoreData(theme: theme2)
                theme2.countArchive += theme2.countArchive
                theme2.countAll += theme2.countAll
                theme1.countArchive += theme2.countArchive
                theme1.countAll += theme2.countAll
            }
        }
    }

    func loadCountData(theme: Theme) {
        if let th = findThemes(theme) {
            th.countArchive -= theme.countArchive
            
            let manager = ThemeWordDataManager()
            theme.countArchive = manager.getArchiveWordsCountFromCoreData(theme: theme)
            th.countArchive += theme.countArchive
        }
    }
    
    func findThemes(_ theme: Theme) -> Theme? {
        for th1 in data {
            for th2 in th1.subthemes {
                if th2.name == theme.name {
                    return th1
                }
            }
        }
        return nil
    }

}
