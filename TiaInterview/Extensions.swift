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
    func getGifFrom(_ gif: GiphyGif) {
        if let image = gif.image {
            self.image = image
        }
        else {
            Alamofire.request(gif.image_url).responseData { response in
                let image = UIImage.gif(data: response.data!)
                gif.image = image
                self.image = image
            }
        }
    }
}
