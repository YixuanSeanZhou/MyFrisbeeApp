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

class Post {
    
    var key: String?
    let imageURL: String
    let imageHeight: CGFloat
    let gameTitle: String
    let gameLocation: String
    let gameTime: String
    let poster: User
    
    init(imageURL: String, imageHeight: CGFloat, gameTitle: String, gameLocation: String, gameTime: String){
        self.imageURL = imageURL
        self.imageHeight = imageHeight
        self.gameTitle = gameTitle
        self.gameTime = gameTime
        self.gameLocation = gameLocation
        self.poster = User.current
    }
    
  
    //create a failable initialer in our Post class to take a DataSnapshot.
    
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
    
    
    //Functioning while uploading
    
    var dictValue: [String : Any] {
        let userDict = ["uid" : poster.uid,
                        "username" : poster.username]
        
        return ["image_url" : imageURL,
                "image_height" : imageHeight,
                "game_title" : gameTitle,
                "game_time" : gameTime,
                "game_location" : gameLocation,
                "poster" : userDict]
    }
    
    //Create a new post
    
        

}
