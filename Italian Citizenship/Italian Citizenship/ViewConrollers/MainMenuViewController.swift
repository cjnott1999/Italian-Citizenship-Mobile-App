//
//  MainMenuViewController.swift
//  Italian Citizenship
//
//  Created by Cameron Nottingham on 12/16/19.
//  Copyright © 2019 Cameron Nottingham. All rights reserved.
//

import Foundation
import UIKit

class MainMenuViewContoller: UIViewController, Storyboarded{
    weak var coordintor: MainCoordinator?
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
extension MainMenuViewContoller: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! InformationViewCell
        
        cell.titleLabel.text = cards[indexPath.row].title
        cell.titleLabel.adjustsFontSizeToFitWidth = true
        
        cell.descriptionLabel.text = cards[indexPath.row].subTitle
        cell.descriptionLabel.adjustsFontSizeToFitWidth = true
   
        cell.imageView.image = cards[indexPath.row].image
        
        //Manipulate the cell to make it look good
        let radius: CGFloat = 10
        
        cell.contentView.layer.cornerRadius = radius
        cell.contentView.layer.masksToBounds = true
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 3.0
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false

        cell.layer.cornerRadius = radius
        
        return cell
        
    }
}

extension MainMenuViewContoller: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0{
            coordintor?.presentHistoryViewController()
        }
        else if indexPath.row == 1{
            coordintor?.presentWhereToStartViewController()
        }
        else if indexPath.row == 2 {
            coordintor?.presentConsulateLocationViewControler()
        }
        else if indexPath.row == 3{
            coordintor?.presentSurveyViewController()
        }
    }
}
