//
//  CVInfoModel.swift
//  MyCV
//
//  Created by Marco Espinal on 01/02/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct CVInfoModel: Codable {
    let name, currentPosition, resume, hobbies: String
    let work: [Work]
    let education: Education
    let certificates: [Certificate]
    let interests, skills, languages: [String]
    let personalInfo: [PersonalInfo]
}

// MARK: - Certificate
struct Certificate: Codable {
    let period, name: String
}

// MARK: - Education
struct Education: Codable {
    let period, name, carrer: String
}

// MARK: - PersonalInfo
struct PersonalInfo: Codable {
    let name, value: String
}

// MARK: - Work
struct Work: Codable {
    let position, period, company: String
    let accomplishments: [String]
}
