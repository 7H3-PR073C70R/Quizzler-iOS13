//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var optionalButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    var quizRepository = QuizRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let answerIsCorrect = quizRepository.checkAnswer(sender.currentTitle!)
        
        if answerIsCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        quizRepository.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        
        let currentQuestion = quizRepository.getQuestion()
        let isMultipleChoice = quizRepository.getQuestionIsMultiple()
        optionalButton.isHidden = !isMultipleChoice
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        optionalButton.backgroundColor = UIColor.clear
        questionLabel.text = currentQuestion.text
        progressBar.progress = quizRepository.getProgress()
        scoreLabel.text = quizRepository.getScoreAndProgressText()
        
        if  isMultipleChoice {
            trueButton.setTitle(currentQuestion.possibleAnswers![0], for: .normal)
            falseButton.setTitle(currentQuestion.possibleAnswers![1], for: .normal)
            optionalButton.setTitle(currentQuestion.possibleAnswers![2], for: .normal)
        } else {
            trueButton.setTitle("True", for: .normal)
            falseButton.setTitle("False", for: .normal)
        }
    }
    
}

