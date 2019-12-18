//
//  Question.swift
//  Italian Citizenship
//
//  Created by Cameron Nottingham on 12/14/19.
//  Copyright © 2019 Cameron Nottingham. All rights reserved.
//

import Foundation
import UIKit

enum Response {
    
    case continueSurvey
    case endSurveyIneligible
    case endSurveyCompleted
}

//Quesitions are stored a struct that holds the quesiton data.
//What the quesiton is
//what the response is if the yes button is tapped
//what the repsonse is if the no button is tapped
//where to jump to the next question if necessary
struct Question {
    var questionLabel: String
    
    var yesResponse: Response
    var nextQuestionYesIndex: Int?
    
    var noResponse: Response
    var nextQuestionNoIndex: Int?
}

