//
//  Questions.swift
//  Italian Citizenship
//
//  Created by Cameron Nottingham on 12/16/19.
//  Copyright © 2019 Cameron Nottingham. All rights reserved.
//

import Foundation
import UIKit

//These are the quesitons, this isnt very reusable right now, but it may be improved in the future
var question0 = Question(questionLabel: "Are you the direct descendant of an Italian Immigrant?", yesResponse: .continueSurvey, nextQuestionYesIndex: 1, noResponse: .endSurveyIneligible)

var question1 = Question(questionLabel: "Did your Italian ancestor naturalize or die BEFORE March 17, 1861?", yesResponse: .endSurveyIneligible,  noResponse: .continueSurvey, nextQuestionNoIndex: 2)

var question2 = Question(questionLabel: "Did your Italian ancestor acquire a foreign citizenship before August 16, 1992?", yesResponse: .continueSurvey, nextQuestionYesIndex: 3,  noResponse: .continueSurvey, nextQuestionNoIndex: 8)

var question3 = Question(questionLabel: "Did the acquisition occur while the next person in the line of citizenship transmission was already born?", yesResponse: .continueSurvey, nextQuestionYesIndex: 4, noResponse: .endSurveyIneligible)

var question4 = Question(questionLabel: "Did the citizenship acquisition occur while the next person in the line of citizenship transmission was a minor?", yesResponse: .continueSurvey, nextQuestionYesIndex: 5, noResponse: .continueSurvey, nextQuestionNoIndex: 8)

var question5 = Question(questionLabel: "Did your Italian ancestor acquire the foreign citizenship before July 1, 1912?", yesResponse: .endSurveyIneligible, noResponse: .continueSurvey, nextQuestionNoIndex: 6)

var question6 = Question(questionLabel: "Was the minor child born in a country that defines citizenship by jure soli (like the United States)", yesResponse: .continueSurvey, nextQuestionYesIndex: 8, noResponse: .continueSurvey, nextQuestionNoIndex: 7)

var question7 = Question(questionLabel: "Was the child with the parent outside Italy at the time the parent acquired the other citizenship and did that child acquire citizenship with the parent?", yesResponse: .endSurveyIneligible, noResponse: .continueSurvey, nextQuestionNoIndex: 8)

var question8 = Question(questionLabel: "Are there any females in your line of Italian citizenship transmission?", yesResponse: .continueSurvey, nextQuestionYesIndex: 9, noResponse: .continueSurvey, nextQuestionNoIndex: 10)

var question9 = Question(questionLabel: "Was the child of your female ancestor born on/after January 1, 1948?", yesResponse: .continueSurvey, nextQuestionYesIndex: 10, noResponse: .endSurveyIneligible)

var question10 = Question(questionLabel: "Did you or anyone in the line of citizenship transmission ever formally renounce Italian citizenship before an Italian authority?" , yesResponse: .endSurveyIneligible, noResponse: .endSurveyCompleted)




var questions = [question0, question1,question2, question3, question4, question5, question6, question7, question8, question9, question10]
