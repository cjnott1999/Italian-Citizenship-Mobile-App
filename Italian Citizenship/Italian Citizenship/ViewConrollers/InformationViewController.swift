//
//  InformationViewController.swift
//  Italian Citizenship
//
//  Created by Cameron Nottingham on 12/14/19.
//  Copyright © 2019 Cameron Nottingham. All rights reserved.
//

import Foundation
import UIKit

class InformationViewContoller: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var italyImage: UIImageView!
    @IBOutlet weak var informationTextView: UITextView!
    @IBOutlet weak var nextButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        italyImage.image = UIImage(named: "italy")
        informationTextView.text = "Italian Citizenship is based on the principle of Jus Sanguinis. If you have an Italian ancrestor, you may qualify for Italain citizenship through an adminstrative proceeding. This app will help you determine if you qualify and give you more information about the history of Italian citizenhip as a whole"
        
    }
    @IBAction func nextTapped(_ sender: Any) {
        coordinator?.presentSurveyStartViewController()
    }
    
}
