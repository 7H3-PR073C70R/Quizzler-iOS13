//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by protector on 1/2/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text : String
    let answer : String
    let possibleAnswers : [String]?
    
    init(q: String, correctAnswer: String, a: [String]? ) {
        self.text = q
        self.answer = correctAnswer
        self.possibleAnswers = a
    }
}

