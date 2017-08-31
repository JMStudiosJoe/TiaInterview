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
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gif", for: indexPath) as! GifCollectionViewCell
        let gif = AllGifs[indexPath.row]
        let gifRect = CGRect(x: CGFloat(0.0), y: CGFloat(0.0), width: CGFloat(gif.width), height: CGFloat(gif.height))

        cell.bounds = gifRect
        cell.gif?.getGifFrom(gif)

        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let bottomEdge:CGFloat = scrollView.contentOffset.y + scrollView.frame.size.height

        if bottomEdge >= scrollView.contentSize.height {
            fetchGifsFromGiphy(howMany: 4)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
