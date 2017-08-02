//
//  Contact.swift
//  MyFrisbeeApp
//
//  Created by Thomas on 2017/8/1.
//  Copyright © 2017年 Thomas. All rights reserved.
//

import Foundation
import UIKit

class ContactViewController: UIViewController{
    
    @IBAction func returnButtonTapped(_ sender: UIButton) {
        
        let initialViewController = UIStoryboard.initialViewController(for: .main)
        self.view.window?.rootViewController = initialViewController
        self.view.window?.makeKeyAndVisible()
    
    
    
    
    }
    
}
