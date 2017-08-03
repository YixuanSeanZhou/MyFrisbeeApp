//
//  Post.swift
//  MyFrisbeeApp
//
//  Created by Thomas on 2017/8/1.
//  Copyright © 2017年 Thomas. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase.FIRDataSnapshot

class UserInfos {

    var userName: String?
    let userTeam: String
    //let userAvatarHeight: CGFloat
    let userAvatarURL: String
    let userPosition: String
    let userGender: String
    let userHeight: String
    let userweight: String
    
//    init(){
//        self.userName = User.current.uid
//        self.userTeam = ""
//        //self.userAvatarHeight = userAvatarHeight
//        self.userAvatarURL = ""
//        self.userPosition = ""
//        self.userGender = ""
//        self.userHeight = ""
//        self.userweight = ""
//    }
    
    
    init(userName: String, userTeam: String, userAvatarHeight: CGFloat, userAvatarURL: String, userPosition: String, userGender: String, userHeight: String, userweight: String){
        self.userName = userName
        self.userTeam = userTeam
        //self.userAvatarHeight = userAvatarHeight
        self.userAvatarURL = userAvatarURL
        self.userPosition = userPosition
        self.userGender = userGender
        self.userHeight = userHeight
        self.userweight = userweight
        //        self.poster = User.current
    }
    
    init?(dictionary: [String: Any], key: String){
        self.userName = dictionary["userNameT"] as? String
        self.userTeam = dictionary["userTeam"] as! String
        self.userAvatarURL = dictionary["userAvatarURL"] as! String
        //self.userAvatarHeight = CGFloat(dictionary["userAvatarHeight"] as! Float)
        self.userPosition = dictionary["userPosition"] as! String
        self.userGender = dictionary["userGender"] as! String
        self.userHeight = dictionary["userHeight"] as! String
        self.userweight = dictionary["userWeight"] as! String
        //        self.poster = dictionary["gamePoster"] as! User
        
        
    }
    
    
    //create a failable initialer in our Post class to take a DataSnapshot.
    /*
     init?(snapshot: DataSnapshot) {
     guard let dict = snapshot.value as? [String : Any],
     
     let imageURL = dict["image_url"] as? String,
     let imageHeight = dict["image_height"] as? CGFloat,
     let gameTitle = dict["game_title"] as? String,
     let gameTime = dict["game_time"] as? String,
     let gameLocation = dict["game_location"] as? String,
     let userDict = dict["poster"] as? [String : Any],
     let uid = userDict["uid"] as? String,
     let username = userDict["username"] as? String
     else {
     return nil
     }
     
     self.poster = User(uid: uid, username: username)
     
     //What is key used for
     
     self.key = snapshot.key
     self.imageURL = imageURL
     self.imageHeight = imageHeight
     self.gameTitle = gameTitle
     self.gameTime = gameTime
     self.gameLocation = gameLocation
     
     
     }
     
     */
    //Functioning while uploading
    
    //    var dictValue: [String : Any] {
    //        let userDict = ["uid" : poster.uid,
    //                        "username" : poster.username]
    //
    //        return ["image_url" : imageURL,
    //                "image_height" : imageHeight,
    //                "game_title" : gameTitle,
    //                "game_time" : gameTime,
    //                "game_location" : gameLocation,
    //                "poster" : userDict]
    
    
    //Create a new post
    
    
    
}
