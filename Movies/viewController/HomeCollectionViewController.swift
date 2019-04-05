//
//  HomeCollectionViewController.swift
//  Movies
//
//  Created by ashraf on 3/31/19.
//  Copyright © 2019 ashraf. All rights reserved.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "Cell"
var detailsViewController :DetailsViewController!

class HomeCollectionViewController: UICollectionViewController {
    
    var movies : [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsViewController = (self.storyboard?.instantiateViewController(withIdentifier: "MovieDetails"))! as! DetailsViewController

        let alamofire : AlamofireHandeller = AlamofireHandeller()
        alamofire.getMovies { (movies) in
            self.movies = movies
            self.collectionView?.reloadData()
        }
    }
    
    func test() -> () {
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
