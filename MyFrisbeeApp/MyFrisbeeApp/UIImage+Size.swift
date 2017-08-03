//
//  UIImage+Size.swift
//  MyFrisbeeApp
//
//  Created by Thomas on 2017/8/2.
//  Copyright © 2017年 Thomas. All rights reserved.
//

import Foundation
import UIKit


extension UIImage {
    var aspectHeight: CGFloat {
        let heightRatio = size.height / 736
        let widthRatio = size.width / 414
        let aspectRatio = fmax(heightRatio, widthRatio)
        
        return size.height / aspectRatio
    }
}
