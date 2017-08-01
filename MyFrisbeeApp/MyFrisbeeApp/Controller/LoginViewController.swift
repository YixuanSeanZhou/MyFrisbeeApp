//
//  LoginViewController.swift
//  MyFrisbeeApp
//
//  Created by Thomas on 2017/8/1.
//  Copyright © 2017年 Thomas. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

class LoginViewController : UIViewController {
    
    
    
    @IBAction func LoginButtonTapped(_ sender: Any) {
        
        guard let authUI = FUIAuth.defaultAuthUI()
            //Mail Interface
            else { return }
        
        // 2
        authUI.delegate = self
        
        // 3
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        
        // 1
        guard let user = user
            else { return }
        
        // 2
        let userRef = Database.database().reference().child("users").child(user.uid)
        
        // what is unowned self
        userRef.observeSingleEvent(of: .value, with: { [unowned self] (snapshot) in
           // print (user)
            if let user = User(snapshot: snapshot) { //existing user
                //print ("what")
                User.setCurrent(user)
                
                //Loading another storyboard
                //Here want to load the Main
                //With enum

                let storyboard = UIStoryboard(type: .main)
                

                if let initialViewController = storyboard.instantiateInitialViewController() {
                    self.view.window?.rootViewController = initialViewController
                    self.view.window?.makeKeyAndVisible()
                }
            } else { // new user creation
                //print ("give me ")
                self.performSegue(withIdentifier: Constants.Segue.toCreateUsername, sender: self)
                
            }
            //print("give")
        })
    }
}
