//
//  CreateAGameViewController.swift
//  MyFrisbeeApp
//
//  Created by gaoqingli on 02/08/2017.
//  Copyright © 2017 Thomas. All rights reserved.
//

import UIKit

class CreateAGameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var titleTextField: UITextField!

    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var gameImageImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var viewPlayersButton: UIButton!
    @IBAction func cancelBarButtonTapped(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(type: .main)
        if let initialViewController = storyboard.instantiateInitialViewController() {
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
    }

    @IBAction func doneBarButtonTapped(_ sender: Any) {
        titleTextField.isUserInteractionEnabled=false
        locationTextField.isUserInteractionEnabled=false
        timeTextField.isUserInteractionEnabled=false
        descriptionTextView.isUserInteractionEnabled=false
        
        
        let storyboard = UIStoryboard(type: .main)
        if let initialViewController = storyboard.instantiateInitialViewController() {
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
    }
    
    
    
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
