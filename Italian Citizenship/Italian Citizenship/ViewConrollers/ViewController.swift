//
//  ViewController.swift
//  Italian Citizenship
//
//  Created by Cameron Nottingham on 12/10/19.
//  Copyright © 2019 Cameron Nottingham. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?

    @IBOutlet weak var welcomeLabel: UILabel!

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var italyImageView: UIImageView!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //Override viewWillAppear and animate the welcome screen
    override func viewWillAppear(_ animated: Bool) {
        self.welcomeLabel.alpha = 0
        self.welcomeLabel.text = "Welcome."
        self.italyImageView.image = UIImage(named: "flag")!
        self.italyImageView.alpha = 0
        self.welcomeLabel.fadeIn(completion: {
                (finished: Bool) -> Void in
        
            UIView.animate(withDuration: 2.0) { [weak self] in
                self?.heightConstraint.constant = -((self?.view.bounds.height)! / 2) + 100
                self?.view.layoutIfNeeded()
            }
            UIView.animate(withDuration: 3.0) { [weak self] in
                self?.italyImageView.alpha = 1
                self?.italyImageView.layer.shadowColor = UIColor.black.cgColor
                self?.italyImageView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
                self?.italyImageView.layer.shadowRadius = 3.0
                
            }
            })
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        coordinator?.presentInfoViewController()
    }
    
}


