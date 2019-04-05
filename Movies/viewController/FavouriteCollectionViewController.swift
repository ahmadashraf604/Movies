//
//  Favourite CollectionViewController.swift
//  Movies
//
//  Created by ashraf on 4/5/19.
//  Copyright © 2019 ashraf. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FavouriteCollectionViewController: UICollectionViewController {
    
    var detailsViewController :DetailsViewController!
    
    var movies : [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsViewController = (self.storyboard?.instantiateViewController(withIdentifier: "MovieDetails"))! as! DetailsViewController
        
        let coreDataHandeller = CoreDataHandeller()
        coreDataHandeller.getMovies { (m) in
            self.movies = m
            self.collectionView?.reloadData()
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
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
    
}
