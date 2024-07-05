//
//  UserModel.swift
//  EduSwapper
//
//  Created by Sandro Gelashvili on 05.07.24.
//

import Foundation

struct UserModel: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
    let skill: String
    let imageName: String
}
