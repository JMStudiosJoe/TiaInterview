//
//  Extensions.swift
//  TiaInterview
//
//  Created by Joseph Richardson on 8/31/17.
//  Copyright © 2017 Joseph Richardson. All rights reserved.
//


import Alamofire
import SwiftGifOrigin


extension UIImageView {
    func getGifFrom(url: String) {
        
        Alamofire.request(url).responseData { response in
            let image = UIImage.gif(data: response.data!)
            self.image = image
        }
    }
}
