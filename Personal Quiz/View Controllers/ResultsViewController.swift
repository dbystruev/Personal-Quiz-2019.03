//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by Denis Bystruev on 14/03/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateResult()
    }
    
    func calculateResult() {
        var typeFrequency = [PersonType: Int]()
        
        let types = responses.map { $0.type }
        
        types.forEach { typeFrequency[$0] = (typeFrequency[$0] ?? 0) + 1 }
        
        let sortedTypeFrequency = typeFrequency.sorted { $0.value > $1.value }
        let result = sortedTypeFrequency.first!.key
        
        updateUI(with: result)
    }
    
    func updateUI(with person: PersonType) {
        resultAnswerLabel.text = "Вы — \(person.rawValue)"
        resultDefinitionLabel.text = person.definition
    }

}
