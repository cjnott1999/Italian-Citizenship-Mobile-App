//
//  EligibleViewController.swift
//  Italian Citizenship
//
//  Created by Cameron Nottingham on 12/15/19.
//  Copyright © 2019 Cameron Nottingham. All rights reserved.
//

import Foundation
import UIKit

class EligibleViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?

    
    override func viewDidLoad() {
        super.viewDidLoad()
      

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        coordinator?.presentMainMenuViewController()
    }

}
