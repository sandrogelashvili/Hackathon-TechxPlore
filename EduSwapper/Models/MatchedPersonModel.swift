//
//  MatchedPersonModel.swift
//  EduSwapper
//
//  Created by Sandro Gelashvili on 06.07.24.
//

import Foundation

struct Match: Identifiable {
    let id = UUID()
    let name: String
    let canTeach: String
    let wantsToLearn: String
    let imageName: String
}
