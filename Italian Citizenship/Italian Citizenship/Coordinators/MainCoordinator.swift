//
//  MainCoordinator.swift
//  Italian Citizenship
//
//  Created by Cameron Nottingham on 12/14/19.
//  Copyright © 2019 Cameron Nottingham. All rights reserved.
//

import Foundation
import  UIKit

class MainCoordinator: Coordinator{
    
    //Conform to protocol
    func start() {}
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
    }
    
    //Overload start to handle first launches 
    func start(firstTime: Bool) {
        if firstTime{
            let vc = ViewController.instantiate()
            vc.coordinator = self
            navigationController.pushViewController(vc, animated: false)
        }
        else {
            presentMainMenuViewController()
        }
    }
    
    func presentInfoViewController() {
      
        let vc = InformationViewContoller.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func presentSurveyStartViewController() {
     
        let vc = SurveyStartViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    //This should ony be called the FIRST time the survey is presented
    func presentSurveyViewController() {
     
        let vc = SurveyViewContoller.instantiate()
        vc.coordinator = self
        vc.question = question0
        navigationController.pushViewController(vc, animated: true)
    }
    
    func presentIneligibleViewController(){
     
        let vc = IneligibleViewcontroller.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func presentEligibleViewController(){

        let vc = EligibleViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

    
    func presentMainMenuViewController() {

        let vc = MainMenuViewContoller.instantiate()
        vc.coordintor = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func presentHistoryViewController(){
        let vc = HistoryViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func presentConsulateLocationViewControler(){
        let vc = ConsulateLocationViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func presentLawDetailViewController(law: Int){
        let vc = LawDetailViewController.instantiate()
        vc.coordinator = self
        vc.lawDescription = lawDescriptions[law]
        navigationController.pushViewController(vc, animated: true)
    }
    
    func presentWhereToStartViewController(){
        let vc = WhereToStartViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}
