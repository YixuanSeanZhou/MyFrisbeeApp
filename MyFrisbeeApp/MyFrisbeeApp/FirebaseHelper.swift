//
//  FirebaseHelper.swift
//  MyFrisbeeApp
//
//  Created by Thomas on 2017/8/2.
//  Copyright © 2017年 Thomas. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuthUI


struct FirebaseHelper {
  
    static func createGame(gameTitle: String, gameTime: String, gameLocation: String, gameURL : String, gameHeight: Float){
       //sst dictionary
        
        
        let dict = ["gameTitle": gameTitle,
                    "gameTime": gameTime,
                    "gameLocation": gameLocation,
                    "gameURL": gameURL,
                    "gameHeight": gameHeight,
                    "gamePoster": User.current.username] as [String : Any]
        
        let ref = Database.database().reference().child("games").childByAutoId()
     //ste reference on database
        
        
        ref.updateChildValues(dict)
    }
    
    //
    

     static func getGames(completion: @escaping([Game]) -> ()) {
        //where to find our data
        var array = [Game]()
        let ref = Database.database().reference().child("games")
        ref.observeSingleEvent(of: .value, with:{ (snapshot) in
            if let dictionary = snapshot.value as? [String: Any]{
            
                for key in dictionary.keys{
                    let game = Game(dictionary: dictionary[key] as! [String : Any], key : key)
                    array.append(game!)
                }
            }
          completion(array)
        })
     }
     
     
     
     
     
   
    
    
    
}
