//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by protector on 1/2/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct QuizRepository {
    let quiz = [
        Question(q: "A slug's blood is green.", correctAnswer: "True", a: nil),
        Question(q: "Approximately one quarter of human bones are in the feet.", correctAnswer: "True",  a: nil),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", correctAnswer: "True",  a: nil),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", correctAnswer: "True",  a: nil),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", correctAnswer: "False",  a: nil),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", correctAnswer: "True",  a: nil),
        Question(q: "You can lead a cow down stairs but not up stairs.", correctAnswer: "False",  a: nil),
        Question(q: "Google was originally called 'Backrub'.", correctAnswer: "True",  a: nil),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", correctAnswer: "True",  a: nil),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", correctAnswer: "False", a: nil),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", correctAnswer: "False", a: nil),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", correctAnswer: "True", a: nil),
        Question(q: "Which is the largest organ in the human body?", correctAnswer: "Skin", a: ["Heart", "Skin", "Large Intestine"]),
        Question(q: "Five dollars is worth how many nickels?", correctAnswer: "100", a: ["25", "50", "100"]),
        Question(q: "What do the letters in the GMT time zone stand for?", correctAnswer: "Greenwich Mean Time", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"]),
        Question(q: "What is the French word for 'hat'?", correctAnswer: "Chapeau", a: ["Chapeau", "Écharpe", "Bonnet"]),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", correctAnswer: "Watch", a: ["Notebook", "Handkerchief", "Watch"]),
        Question(q: "How would one say goodbye in Spanish?", correctAnswer: "Adiós", a: ["Au Revoir", "Adiós", "Salir"]),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", correctAnswer: "Orange", a: ["Green", "Orange", "Blue"]),
        Question(q: "What alcoholic drink is made from molasses?", correctAnswer: "Rum", a: ["Rum", "Whisky", "Gin"]),
        Question(q: "What type of animal was Harambe?", correctAnswer: "Gorilla", a: ["Panda", "Gorilla", "Crocodile"]),
        Question(q: "Where is Tasmania located?", correctAnswer: "Australia", a: ["Indonesia", "Australia", "Scotland"])

    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        let answerIsCorrect =  quiz[questionNumber].answer == userAnswer
        if answerIsCorrect {
            score += 1
        }
        return answerIsCorrect
    }
    
    func  getQuestion() -> Question {
        return quiz[questionNumber]
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    mutating func nextQuestion() {
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
    func getScoreAndProgressText() -> String {
        return "\(questionNumber + 1) OF \(quiz.count)\nScore: \(score)"
    }
    
    func getQuestionIsMultiple() -> Bool {
        return quiz[questionNumber].possibleAnswers != nil
    }
}