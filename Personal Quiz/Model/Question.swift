//
//  Question.swift
//  Personal Quiz
//
//  Created by Denis Bystruev on 14/03/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

struct Question {
    var text: String
    var type: ResponceType
    var answers: [Answer]
    
    static func loadData() -> [Question] {
        return [
            Question(
                text: "Для успеха надо",
                type: .single,
                answers: [
                    Answer(text: "Работать > 12 ч в день", type: .junior),
                    Answer(text: "Работать > 8 ч в день", type: .middle),
                    Answer(text: "Работать эффективно", type: .senior),
                    Answer(text: "Делегировать", type: .director),
                ]
            ),
            Question(
                text: "Вам дали дополнительные задачи",
                type: .multiple,
                answers: [
                    Answer(text: "Сделаю после работы", type: .junior),
                    Answer(text: "Приоритезирую", type: .middle),
                    Answer(text: "Откажусь", type: .senior),
                    Answer(text: "Передам", type: .director),
                ]
            ),
            Question(
                text: "Эффективнее всего",
                type: .ranged,
                answers: [
                    Answer(text: "Сделать и не отчитаться", type: .junior),
                    Answer(text: "Сделать и отчитаться", type: .middle),
                    Answer(text: "Не сделать и отчитаться", type: .senior),
                    Answer(text: "Не сделать и не отчитаться", type: .director),
                ]
            ),
        ]
    }
}

enum ResponceType {
    case single, multiple, ranged
}
