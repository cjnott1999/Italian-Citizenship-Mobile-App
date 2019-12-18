//
//  Storyboarded.swift
//  Italian Citizenship
//
//  Created by Cameron Nottingham on 12/14/19.
//  Copyright © 2019 Cameron Nottingham. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self{
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main" , bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
