//
//  ImageCorner.swift
//  GitHubDemo
//
//  Created by MacHD on 05/09/19.
//  Copyright © 2019 MacHD. All rights reserved.
//

import Foundation
import UIKit
class GLobal: NSObject {
   static func CornerOfImageView(ImageView:UIImageView){
      ImageView.layer.cornerRadius = 5
        ImageView.clipsToBounds = true
    }
}

