//
//  HistoryViewController.swift
//  Italian Citizenship
//
//  Created by Cameron Nottingham on 12/16/19.
//  Copyright © 2019 Cameron Nottingham. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController:UIViewController, Storyboarded{
    weak var coordinator: MainCoordinator?
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var headerImage: UIImageView!

 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerImage.image = UIImage(named: "italyemblem")!
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

extension HistoryViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return italianLaws.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LawDetailTableCell", for: indexPath) as! LawDetailTableCell
        
        cell.label.text = italianLaws[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.presentLawDetailViewController(law: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
