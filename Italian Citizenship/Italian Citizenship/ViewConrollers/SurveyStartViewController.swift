//
//  SurveyStartViewController.swift
//  Italian Citizenship
//
//  Created by Cameron Nottingham on 12/14/19.
//  Copyright © 2019 Cameron Nottingham. All rights reserved.
//

import Foundation
import UIKit

class SurveyStartViewController: UIViewController, Storyboarded{
    weak var coordinator: MainCoordinator?
    @IBOutlet weak var firstLineLabel: UILabel!
    @IBOutlet weak var secondLineLabel: UILabel!
    @IBOutlet weak var thirdLineLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        
        firstLineLabel.adjustsFontSizeToFitWidth = true
        secondLineLabel.adjustsFontSizeToFitWidth = true
        thirdLineLabel.adjustsFontSizeToFitWidth = true
        
        firstLineLabel.alpha = 0
        secondLineLabel.alpha = 0
        thirdLineLabel.alpha = 0
        
        nextButton.isHidden = true
           
           firstLineLabel.fadeIn(completion: {
               (finished: Bool) -> Void in
               self.secondLineLabel.fadeIn(completion: {
                   (finished: Bool) -> Void in
                   self.thirdLineLabel.fadeIn(completion: {
                       (finished: Bool) -> Void in
                       self.nextButton.isHidden = false
                   })
               })
           })
        
   

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func nextTapped(_ sender: Any) {
        coordinator?.presentSurveyViewController()
    }
}
