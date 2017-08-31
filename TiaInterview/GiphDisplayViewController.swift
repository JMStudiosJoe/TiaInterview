//
//  GiphDisplayViewController.swift
//  TiaInterview
//
//  Created by Joseph Richardson on 8/31/17.
//  Copyright © 2017 Joseph Richardson. All rights reserved.
//

import UIKit

class GiphDisplayViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var displayGifs: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        nc.addObserver(forName:Notification.Name(rawValue:"loadedData"),
                       object:nil, queue:nil,
                       using:reloadGifData)
        
        getGifsFromGiphy()
        
        
        // Do any additional setup after loading the view.
    }
    
    func reloadGifData(notification:Notification) {
        displayGifs.reloadData()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return AllGifs.count
    }
    
    //MARK:Display Provider CollectionView cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gif", for: indexPath) as! GifCollectionViewCell
        let gif = AllGifs[indexPath.row]
        cell.gif.image = UIImage(contentsOfFile: gif.image_url)
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
