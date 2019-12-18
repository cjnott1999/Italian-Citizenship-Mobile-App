//
//  WhereToStartViewController.swift
//  Italian Citizenship
//
//  Created by Cameron Nottingham on 12/17/19.
//  Copyright © 2019 Cameron Nottingham. All rights reserved.
//

import Foundation
import UIKit

class WhereToStartViewController: UIViewController, Storyboarded{
    weak var coordinator: MainCoordinator?
    @IBOutlet weak var detailTextView: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTextView.text =
        """
        In order to establish your claim of citizenship, you’ll need documents (vital records) supporting the descent of each person in your line from the previous person. You’ll also need documents establishing whether and when your LIRA naturalized, which will show that he or she did not lose Italian citizenship before the next person in your line was born. In addition, all recognized Italian citizens are required to keep their home comune up-to-date with any changes in their status, such as marriage, divorce, or the birth of their children.
        
        After you find out you qualify, you should schedule an appointment at your consualte immediately. To schedule an appointment, you must use Prenota.  Prenota is the online program used to make appointments inside the Italian consular network to obtain consular services. Prenota is derived from the Italian verb prenotare meaning “to reserve.” Use this app to find your local consulate and it will link you to its Prenota page.
        
        You will need a birth certificate or baptismal certificate for at least one ancestor from Italy (your LIRA), which could be yourself. You may also need a birth certificate for that person’s spouse, if he or she was born in Italy and your consulate requires it. You must request an estratto di nascita in formato internazionale. This means, “birth extract in international format” and contains information such as place of birth, parents names, and more. This is not to be confused with a certificato di nascita, which does NOT contain the necessary amount of information the Consulate requires.
        
        You will need to collect vital records from the relevant US states for your ancestor (marriage and death certificates if applicable) and every subsequent person in your line of succession down to yourself. Depending on your consulate, you may need to collect documents related to the non-line spouses of people in your line as well. All documents must be long form and autorized with an Apostille. All documents will also need to be traslated into Italian. 
        
        """
    }
    
  
}
