//
//  User.swift
//  TwoScreens
//
//  Created by Arseniy Oksenoyt on 06.07.2022.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            login: "user",
            password: "password",
            person: Person(
                firstName: "Arseniy",
                familyName: "Oksenoyt",
                description: "Меня зовут Арсений. \n\nМне 35 лет, родился в Москве и всю свою жизнь работал маркетологом. И вот наконец-то решился: ну нафиг эту рекламу:) Тем более с логикой проблем никогда не было. Так что мы с моей девушкой долго выбирали курсы и остановились на вас. Не прогадали:) \n\nP.S. Сейчас живу в США:)",
                photo: "Arseniy"
            )
        )
    }
}

struct Person {
    let firstName: String
    let familyName: String
    let description: String
    let photo: String
}
