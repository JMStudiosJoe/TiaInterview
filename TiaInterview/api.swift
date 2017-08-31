//
//  api.swift
//  TiaInterview
//
//  Created by Joseph Richardson on 8/31/17.
//  Copyright © 2017 Joseph Richardson. All rights reserved.
//


import Alamofire
let nc = NotificationCenter.default

let giphyURL: String = "https://api.giphy.com/v1/gifs/random?api_key=9d7dbfe707004b9798b7815c5642d002"

var AllGifs = [GiphyGif]()

func getGifsFromGiphy(_ total: Int) {
    
    Alamofire.request(giphyURL).validate(contentType: ["application/json"]).responseJSON { response in
        if let jsonResult = response.result.value as? Dictionary<String, Any> {

            var giphyResponse = jsonResult["data"] as? Dictionary<String, Any>
            let image_url = giphyResponse?["image_url"] as! String
            let image_height = giphyResponse?["image_height"] as! String
            let image_width = giphyResponse?["image_width"] as! String

            let newestGif = GiphyGif(url: image_url, width: Int(image_width)!, height: Int(image_height)!)
            AllGifs.append(newestGif)

            if AllGifs.count == total {
                nc.post(name:Notification.Name(rawValue:"loadedData"), object: nil)
            }
        }
        else {
            print("there was an error")
        }
    }
}

func fetchGifsFromGiphy(howMany numOfGifs: Int) {
    let total = AllGifs.count + numOfGifs
    for _ in 1...numOfGifs {
        getGifsFromGiphy(total)
    }
}

