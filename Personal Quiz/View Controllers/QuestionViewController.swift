//
//  QuestionViewController.swift
//  Personal Quiz
//
//  Created by Denis Bystruev on 14/03/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: - ... @IBOutlet
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multiLabels: [UILabel]!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    // MARK: - ... Properties
    var questions: [Question]!
    var questionIndex = 0

    // MARK: - ... UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Question.loadData { questions in
            if let questions = questions {
                self.questions = questions
            } else {
                self.questions = Question.loadData()
            }
            
            self.updateUI()
        }
    }
    
    // MARK: - ... Custom Methods
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        
        let minCount = min(singleButtons.count, answers.count)
        
        for i in 0..<minCount {
            let title = answers[i].text
            singleButtons[i].setTitle(title, for: [])
        }
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        
        let minCount = min(multiLabels.count, answers.count)
        
        for i in 0..<minCount {
            let text = answers[i].text
            multiLabels[i].text = text
        }
    }
    
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedLabels[0].text = answers.first?.text
        rangedLabels[1].text = answers.last?.text
    }
}
