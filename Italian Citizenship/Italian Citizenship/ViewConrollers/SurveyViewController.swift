//
//  SurveyViewController.swift
//  Italian Citizenship
//
//  Created by Cameron Nottingham on 12/14/19.
//  Copyright © 2019 Cameron Nottingham. All rights reserved.
//

import Foundation
import UIKit

class SurveyViewContoller: UIViewController, Storyboarded{
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var quesitonView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    var question: Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.adjustsFontSizeToFitWidth = true
        quesitonView.layer.cornerRadius = 10
        loadData()
    }
    
    func loadData(){
        questionLabel.text = self.question!.questionLabel
    }
    
    @IBAction func yesTapped(_ sender: Any) {
        respond(response: question!.yesResponse, nextQuestionIndex: question!.nextQuestionYesIndex)
    }
    @IBAction func noTapped(_ sender: Any) {
        respond(response: question!.noResponse, nextQuestionIndex: question!.nextQuestionNoIndex)
    }
    
    
    //this handles the repsonse given by the yes/no buttons
    func respond(response: Response, nextQuestionIndex: Int?){
        switch response {
        case .endSurveyIneligible:
            coordinator?.presentIneligibleViewController()
        case .endSurveyCompleted:
            coordinator?.presentEligibleViewController()
        case .continueSurvey:
            DispatchQueue.main.async {
                //If we made it here, the index exits so we can force unwrap safely
                self.question = questions[nextQuestionIndex!]
                self.loadData()
            }
        }
        
    }
    

    
}
