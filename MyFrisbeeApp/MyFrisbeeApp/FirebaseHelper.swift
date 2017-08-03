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
    
    //Writing data to Firebase
    
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
    
    
    static func editUserInfo(userName: String, userTeam: String, userGender: String,  userPosition : String, userHeight: String, userWeight: String, userAvatarURL: String, userAvatarHeight: Float){
        //sst dictionary
        
        
        let dict = ["userName": userName,
                    "userTeam": userTeam,
                    "userGender": userGender,
                    "userPosition": userPosition,
                    "userHeight": userHeight,
                    "userWeight": userWeight,
//                    "userAvatarHeight": userAvatarHeight,
                    "userAvatarURL": userAvatarURL
                    ] as [String : Any]
        
        let ref = Database.database().reference().child("users").child(User.current.uid)
        //ste reference on database
        
        
        ref.updateChildValues(dict)
    }

    
    
    
    
    
    
    
    
    
    
    // Getting Data From Firebase
    

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
    
    
    
    static func getUserInfos(completion: @escaping(UserInfos) -> ()) {
        //where to find our data
      
        let ref = Database.database().reference().child("users").child(User.current.uid)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
             let userInfo = UserInfos(dictionary: snapshot.value as! [String : Any], key: snapshot.key)
 
                completion(userInfo!)
        })
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
