//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Shakhaidar Miras
//

import Foundation
struct Question{
    let question: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        question = q
        answer = a
        self.correctAnswer = correctAnswer
    }
}

