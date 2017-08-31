//
//  GiphyGif.swift
//  TiaInterview
//
//  Created by Joseph Richardson on 8/31/17.
//  Copyright © 2017 Joseph Richardson. All rights reserved.
//

import Foundation
import UIKit

class GiphyGif {
    
    var image_url: String = ""
    var width: Int = 0
    var height: Int = 0
    var image: UIImage?
    
    init( url: String, width: Int, height: Int) {
        self.image_url = url
        self.height = height
        self.width = width
    }
}
