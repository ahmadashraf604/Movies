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

class HomeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var movies : [Movie] = []
    var alamofire : AlamofireHandeller!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsViewController = (self.storyboard?.instantiateViewController(withIdentifier: "MovieDetails"))! as! DetailsViewController
        alamofire  = AlamofireHandeller()
        getMovie(sortingType: "")
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
        detailsViewController.isFavourite = false
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width/2, height: collectionView.bounds.width*3/4)
    }
    
    @IBAction func editSort(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Sorting by", message: "select which type you want to sort movies by", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "most popular", style: UIAlertActionStyle.default, handler: {action in
            self.getMovie(sortingType: self.alamofire.popular)
        }))
        alert.addAction(UIAlertAction(title: "highest rated", style: UIAlertActionStyle.default, handler: {action in
            self.getMovie(sortingType: self.alamofire.topRated)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: {action in
            print("cancel")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func getMovie(sortingType : String){
        alamofire.getMovies(sortingType: sortingType, updateView: { (movies) in
            self.movies.removeAll()
            self.movies = movies
            self.collectionView?.reloadData()
        })
    }
    
}
