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
                description: "Bla bla bla"
            )
        )
    }
}

struct Person {
    let firstName: String
    let familyName: String
    let description: String
}