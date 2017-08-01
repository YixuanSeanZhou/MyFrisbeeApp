//
//  CreatUsernameViewController.swift
//  MyFrisbeeApp
//
//  Created by Thomas on 2017/8/1.
//  Copyright © 2017年 Thomas. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
   
    override func viewDidLoad() {
        super .viewDidLoad()
        
        nextButton.layer.cornerRadius = 6
        
    }
    
    
    
    
    
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
    
        guard let firUser = Auth.auth().currentUser,
            let username = usernameTextField.text,
            !username.isEmpty
            else{
                return
        }
        
            UserService.create(firUser, username: username) { (user) in
                guard let user = user
                    else{
                        return
                }
                
                User.setCurrent(user)
                
                print("Created new user : \(user.username)")
                
                let storyboard = UIStoryboard(name: "Main", bundle: .main)
                if let initialViewController = storyboard.instantiateInitialViewController(){
                
                    self.view.window?.rootViewController = initialViewController
                    self.view.window?.makeKeyAndVisible()
                
            }
        }
        
    }

}
