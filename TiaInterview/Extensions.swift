//
//  Extensions.swift
//  TiaInterview
//
//  Created by Joseph Richardson on 8/31/17.
//  Copyright © 2017 Joseph Richardson. All rights reserved.
//

import Foundation
import Alamofire


extension UIImageView {
    func getImageFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        
        Alamofire.request(url).responseJSON { response in
            if let jsonResult = response.result.value as? Dictionary<String, Any> {
                print(jsonResult)
                //make uiimage from data
                //set image to new image
            }
            else {
                print("ERROR GETTING IMAGE directly")
            }
        }
        
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
}
