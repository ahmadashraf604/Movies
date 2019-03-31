//
//  HomeCollectionViewController.swift
//  Movies
//
//  Created by ashraf on 3/31/19.
//  Copyright © 2019 ashraf. All rights reserved.
//

import UIKit
import SDWebImage
import Alamofire

private let reuseIdentifier = "Cell"
var detailsViewController :DetailsViewController!

class HomeCollectionViewController: UICollectionViewController {
    var movies :[Movie] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsViewController = (self.storyboard?.instantiateViewController(withIdentifier: "MovieDetails"))! as! DetailsViewController
        
        let strURL = "https://api.themoviedb.org/3/discover/movie?api_key=e07070a3952fcf18a91b6d1aaf196f8c"
        
        Alamofire.request(strURL).responseJSON { (responseObject) -> Void in
            
            if responseObject.result.isSuccess {
                let moviesData = try! JSONDecoder().decode(MoviesData.self, from: responseObject.data!)
                self.movies += moviesData.movies
                self.collectionView?.reloadData()
            }
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> MyCollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        let imageUrl = URL(string: "https://image.tmdb.org/t/p/w185/\(self.movies[indexPath.row].posterPath)")
        cell.image.sd_setImage(with: imageUrl, completed: nil)
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        detailsViewController.movie = movies[indexPath.row]
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     
     return true
     }
     
     */
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
