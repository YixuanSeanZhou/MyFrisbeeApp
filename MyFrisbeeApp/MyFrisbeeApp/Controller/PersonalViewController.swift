//
//  MyselfViewController.swift
//  MyFrisbeeApp
//
//  Created by gaoqingli on 02/08/2017.
//  Copyright © 2017 Thomas. All rights reserved.
//

import UIKit

class MyselfViewController: UIViewController {
    
    //some functions
    func enable()
    {
        nameTextField.isUserInteractionEnabled=true
        teamTextField.isUserInteractionEnabled=true
        positionSementedControl.isUserInteractionEnabled=true
        genderSegementedControl.isUserInteractionEnabled=true
        weightTextField.isUserInteractionEnabled=true
        heightTextField.isUserInteractionEnabled=true
    }
    func disable()
    {
        nameTextField.isUserInteractionEnabled=false
        teamTextField.isUserInteractionEnabled=false
        positionSementedControl.isUserInteractionEnabled=false
        genderSegementedControl.isUserInteractionEnabled=false
        weightTextField.isUserInteractionEnabled=false
        heightTextField.isUserInteractionEnabled=false
    }
    func navigation_apper()
    {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        print ("apper")
    }
    func navigation_disapper()
    {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        print ("apper")
    }
    
    override func viewWillAppear(_ animated : Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        print ("disapper")
        super.viewWillAppear(true)

    }
//    var userInfo = UserInfos()
//
//    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disable()
        
        FirebaseHelper.getUserInfos { (UserInfos) in
            let userinfo = UserInfos
            self.nameTextField.text = userinfo.userName
            self.teamTextField.text = userinfo.userTeam
            self.heightTextField.text = userinfo.userHeight
            
            
           
        }
 
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var avaterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var teamLabel: UILabel!
    
    
    @IBOutlet weak var teamTextField: UITextField!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var genderSegementedControl: UISegmentedControl!

    @IBAction func genderSegementedControlTapped(_ sender: UISegmentedControl) {
        var userGender = Int (genderSegementedControl.selectedSegmentIndex)
    }
    @IBOutlet weak var positionLabel: UILabel!
    
    @IBOutlet weak var positionSementedControl: UISegmentedControl!
    
    @IBAction func positionSegmentedControlTapped(_ sender: UISegmentedControl) {
        var userPosition = Int (positionSementedControl.selectedSegmentIndex)
    }
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var weightTextField: UITextField!
    

    @IBOutlet weak var changeInfoButton: UIButton!
    
    @IBAction func changeInfoButtonTapped(_ sender: UIButton)
    {
        navigation_apper()
        enable()
    }
    @IBAction func cancelBarButtonTapped(_ sender: UIBarButtonItem)
    {
        navigation_disapper()
        disable()
    }
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem)
    {
        navigation_disapper()
        disable()
        FirebaseHelper.editUserInfo(userName: nameTextField.text!, userTeam: teamTextField.text!, userGender: "Male",  userPosition : "Handler", userHeight: heightTextField.text!, userWeight: weightTextField.text!, userAvatarURL: "avc", userAvatarHeight: 2.33)
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
