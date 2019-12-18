//
//  ConsulateLocationViewController.swift
//  Italian Citizenship
//
//  Created by Cameron Nottingham on 12/16/19.
//  Copyright © 2019 Cameron Nottingham. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class ConsulateLocationViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var consulateLabel: UILabel!
    @IBOutlet weak var consulateWebsiteButton: UIButton!
    @IBOutlet weak var prenotaButton: UIButton!
    
    var prenotaURLString: String?
    var websiteURLString: String?
    
    
    
    
    let houston = ["TX", "LA", "OK", "AR"]
    let chicago = ["IL", "MO", "CO", "IA" , "KS", "MN", "NE" , "ND", "SD", "WI", "WI"]
    let detroit = ["IN", "KY", "MI", "OH", "TN"]
    let boston = ["ME", "MA", "NH", "RI", "VT"]
    let dc = ["DC"]
    let sanfrancisco = ["AK", "ID", "MT", "OR", "HI", "UT", "WA"]
    let newyork = ["NY", "CT", "NJ"]
    let miami = ["FL", "GA", "AL", "SC", "MS"]
    let la = ["AZ", "NM", "NV", "CA"]
    let philadelphia = ["PA", "DE", "NC", "WV", "NJ", "MD", "VA"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        consulateLabel.adjustsFontSizeToFitWidth = true
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        self.consulateWebsiteButton.setTitle("", for: .normal)
        self.prenotaButton.setTitle("", for: .normal)
    }
        
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func updateLabels(consultate: String, website: String, prenota: String, websiteURL: String, prenotaURL: String){
        DispatchQueue.main.async {
            self.consulateLabel.text = consultate
            self.consulateWebsiteButton.setTitle(website, for: .normal)
            self.prenotaButton.setTitle(prenota, for: .normal)
            self.prenotaURLString = prenotaURL
            self.websiteURLString = websiteURL
            
        }
    }
    @IBAction func websiteTapped(_ sender: Any) {
        if let url = URL(string: websiteURLString ?? "") {
            UIApplication.shared.open(url, options: [:])
        }
        
    }
    @IBAction func prenotaTapped(_ sender: Any) {
     if let url = URL(string: prenotaURLString ?? "") {
                UIApplication.shared.open(url, options: [:])
            }
    }
    
    

}

extension ConsulateLocationViewController: CLLocationManagerDelegate{
    
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         guard let location: CLLocation = manager.location else { return }
         fetchState(from: location) { state, error in
             guard let state = state, error == nil else { return }
             self.determineConsulate(state: state)
         }
    }
    
    func fetchState(from location: CLLocation, completion: @escaping (_ state: String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            completion(placemarks?.first?.administrativeArea,
                       error)
        }
    }
    
    
    func determineConsulate(state: String){
        if self.houston.contains(state){
            updateLabels(consultate: "Consulate General of Italy, Houston", website: "Houston Consulate Website", prenota: "Houston Consulate Prenota", websiteURL: "https://conshouston.esteri.it/consolato_houston/en/", prenotaURL: "https://prenotaonline.esteri.it/login.aspx?cidsede=100049&ReturnUrl=/")
        }
        else if self.chicago.contains(state){
            updateLabels(consultate: "Consulate General of Italy, Chicago", website: "Chicago Consulate Website", prenota: "Chicago Consulate Prenota", websiteURL: "https://conschicago.esteri.it/consolato_chicago/en/", prenotaURL: "https://prenotaonline.esteri.it/Login.aspx?ReturnUrl=%2Fdefault.aspx&cidsede=100104")
        }
        else if self.detroit.contains(state){
             updateLabels(consultate: "Consulate Generlal of Italy, Detroit", website: "Detroit Consulate Website", prenota: "Detroit Consulate Prenota", websiteURL: "https://consdetroit.esteri.it/consolato_detroit/it/", prenotaURL: "https://prenotaonline.esteri.it/Login.aspx?ReturnUrl=%2Fdefault.aspx&cidsede=100139")
        }
        else if self.philadelphia.contains(state){
             updateLabels(consultate: "Consulate General of Italy, Philadelphia", website: "Philadelphia Consulate Website", prenota: "Philadelphia Consulate Prenota", websiteURL: "https://consfiladelfia.esteri.it/consolato_filadelfia/en/", prenotaURL: "https://prenotaonline.esteri.it/Login.aspx?ReturnUrl=%2Fdefault.aspx&cidsede=100004")
        }
        else if self.la.contains(state){
             updateLabels(consultate: "Consulate General of Italy, Los Angeles", website: "Los Angeles Consulate Website", prenota: "Los Angeles Consulate Prenota", websiteURL: "https://conslosangeles.esteri.it/consolato_losangeles/en/", prenotaURL: "https://prenotaonline.esteri.it/Login.aspx?ReturnUrl=%2Fdefault.aspx&cidsede=100034")
        }
        else if self.sanfrancisco.contains(state){
             updateLabels(consultate: "Consulate General of Italy, San Francisco", website: "San Francisco Consulate Website", prenota: "San Francisco Consulate Prenota", websiteURL: "https://conssanfrancisco.esteri.it/consolato_sanfrancisco/en/", prenotaURL: "https://prenotaonline.esteri.it/Login.aspx?cidsede=100012&returnUrl=/")
        }
        else if self.miami.contains(state){
             updateLabels(consultate: "Consulate General of Italy, Miami", website: "Miami Consulate Website", prenota: "Miami Consulate Prenota", websiteURL: "https://consmiami.esteri.it/consolato_miami/en/", prenotaURL: "https://prenotaonline.esteri.it/login.aspx?cidsede=100170&returnUrl=%2F%2F")
        }
        else if self.newyork.contains(state){
             updateLabels(consultate: "Consulate General of Italy, New York", website: "New York Consalate Website", prenota: "New York Consulate Prenota", websiteURL: "https://consnewyork.esteri.it/consolato_newyork/en/", prenotaURL: "https://prenotaonline.esteri.it/login.aspx?cidsede=100061&ReturnUrl=/")
        }
        else if self.boston.contains(state){
             updateLabels(consultate: "Consulate General of Italy, Boston", website: "Boston Consulate Website", prenota: "Boston Consulate Prenota", websiteURL: "https://consboston.esteri.it/consolato_boston/en/" ,prenotaURL: "https://prenotaonline.esteri.it/login.aspx?cidsede=100017&returnUrl=//")
        }
        else if self.dc.contains(state){
             updateLabels(consultate: "Embassy of Italy, Washington D.C.", website: "D.C. Embassy Website", prenota: "D.C. Embassy Prenota", websiteURL: "https://ambwashingtondc.esteri.it/ambasciata_washington/en", prenotaURL: "https://prenotaonline.esteri.it/login.aspx?cidsede=500000&returnUrl=%2F%2F")
        }
        else{
            updateLabels(consultate: "Outside of the US", website: "", prenota: "", websiteURL: "", prenotaURL: "")
        }
    }
}

