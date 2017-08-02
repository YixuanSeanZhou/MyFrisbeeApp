//
//  TableViewController.swift
//  MyFrisbeeApp
//
//  Created by Thomas on 2017/8/2.
//  Copyright © 2017年 Thomas. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class PickupTableViewController: UITableViewController {
    @IBAction func addTapped(_ sender: UIBarButtonItem) {
    
        print("add")
        
        
        let storyboard = UIStoryboard(type: .create)
        if let initialViewController = storyboard.instantiateInitialViewController() {
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }

    
    
    }

    
    @IBAction func reportTapped(_ sender: UIBarButtonItem) {
        print("as")
        
        let storyboard = UIStoryboard(type: .contact)
        
        
        if let initialViewController = storyboard.instantiateInitialViewController() {
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
        
    }

    
    var games = [Game]() {
        didSet{
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        FirebaseHelper.createGame(gameTitle: "asd", gameTime: "21", gameLocation: "sdf", gameURL: "edf", gameHeight: 123.2)
        
        
        FirebaseHelper.getGames { (games) in
            self.games = games
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return games.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PickupGameInfoCell", for: indexPath) as! PickupGamesInfo

        
        
         cell.titleTextField.text = self.games[Int(indexPath.row)].gameTitle
         cell.locationTextField.text = self.games[Int(indexPath.row)].gameLocation
         cell.timeTextField.text = self.games[Int(indexPath.row)].gameTime
         cell.gameIcon.af_setImage(withURL: URL(string: self.games[Int(indexPath.row)].imageURL)!)
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
