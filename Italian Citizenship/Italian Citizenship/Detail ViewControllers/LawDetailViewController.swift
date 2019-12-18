//
//  LawDetailViewController.swift
//  Italian Citizenship
//
//  Created by Cameron Nottingham on 12/17/19.
//  Copyright © 2019 Cameron Nottingham. All rights reserved.
//

import Foundation
import UIKit

class LawDetailViewController: UIViewController, Storyboarded{
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var textView: UITextView!
    var lawDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = lawDescription ?? ""
    }
}
