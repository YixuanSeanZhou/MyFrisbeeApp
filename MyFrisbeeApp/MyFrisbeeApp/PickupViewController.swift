//
//  PickupViewController.swift
//  MyFrisbeeApp
//
//  Created by Thomas on 2017/8/1.
//  Copyright © 2017年 Thomas. All rights reserved.
//

import Foundation
import UIKit





class PickupViewController: UIViewController{
   
    
    @IBOutlet weak var pickupGamesTableView: UITableView!
    
    
    var post = [Post]()
    
    
    
    
    

    override func viewDidLoad() {
        super .viewDidLoad()
        
        
        //PickupGamesInfo.
        self.pickupGamesTableView.reloadData()
        
    
    
    }
    
    
    
       
    
}





