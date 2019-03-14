//
//  Answer.swift
//  Personal Quiz
//
//  Created by Denis Bystruev on 14/03/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

struct Answer {
    var text: String
    var type: PersonType
}

enum PersonType: Character {
    case junior = "👻", middle = "👮‍♂️", senior = "👨‍🦳", director = "🤴"
    
    var definition: String {
        switch self {
        case .junior:
            return "Вы готовы работать круглосуточно за еду."
        case .middle:
            return "Вы уже знаете себе цену и можете помочь товарищам."
        case .senior:
            return "Вы постигли мудрость, что быстро — не значит хорошо."
        case .director:
            return "Вы умеете мотивировать свою команду и знаете, как добиться результата."
        }
    }
}
