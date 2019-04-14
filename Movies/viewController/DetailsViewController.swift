//
//  DetailsViewController.swift
//  Movies
//
//  Created by ashraf on 3/31/19.
//  Copyright © 2019 ashraf. All rights reserved.
//

import UIKit
import Cosmos

class DetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var btnTrailer: UIButton!
    @IBOutlet weak var btnReview: UIButton!
    @IBOutlet weak var btnFavourite: UIBarButtonItem!
    @IBOutlet weak var titleDetails: UILabel!
    @IBOutlet weak var releaseYearDetails: UILabel!
    @IBOutlet weak var imageDetails: UIImageView!
    @IBOutlet weak var reviewsDetails: UILabel!
    @IBOutlet weak var tableViewDetails: UITableView!
    @IBOutlet weak var ratingDetails: CosmosView!
    
    
    var movie : Movie!
    private var trailers : [Trailer] = []
    private var reviews : [Review] = []
    private var trailerAppear : Bool = true
    private var isFavourite : Bool!
   private  var coreDataHandeller : CoreDataHandeller!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coreDataHandeller = CoreDataHandeller()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isFavourite = coreDataHandeller.isFavourite(movieId: movie.id)
        titleDetails.text = movie.title
        releaseYearDetails.text = movie.releaseDate
        reviewsDetails.text = movie.overview
        ratingDetails.rating = (movie.voteAverage / 2)
        // Show only fully filled stars
        ratingDetails.settings.fillMode = .precise
        let imageUrl = URL(string: "https://image.tmdb.org/t/p/w185/\(movie.posterPath)")
        imageDetails.sd_setImage(with: imageUrl, completed: nil)
        self.getTrailers()
        if isFavourite {
            btnFavourite.image = UIImage(named : "heartFill")
        }else{
            btnFavourite.image = UIImage(named : "heart")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if trailerAppear {
            return trailers.count
        } else{
            return reviews.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableViewDetails.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if trailerAppear {
            cell.textLabel?.text = trailers[indexPath.row].name
            cell.detailTextLabel?.text = ""
        } else{
            cell.textLabel?.text = reviews[indexPath.row].author
            cell.detailTextLabel?.text = reviews[indexPath.row].content
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if trailerAppear {
            let  youtubeUrl = NSURL(string:"https://www.youtube.com/watch?v=\(trailers[indexPath.row].key)")!
            UIApplication.shared.canOpenURL(youtubeUrl as URL)
        }
        
    }
    
    @IBAction func getTrailers(_ sender: UIButton) {
        trailerAppear = true
        self.getTrailers()
    }
    
    @IBAction func getReviews(_ sender: UIButton) {
        trailerAppear = false
        getReviews()
    }
    @IBAction func addFavourite(_ sender: Any) {
        if(!isFavourite){
            coreDataHandeller.addMovie(movie: movie)
            btnFavourite.image = UIImage(named : "heartFill")
            isFavourite = false
        }else{
            coreDataHandeller.deleteMovie(movieId: movie.id)
            btnFavourite.image = UIImage(named : "heart")
            isFavourite = true
        }
    }
    
    func getTrailers(){
        let a = AlamofireHandeller()
        a.getTrailers(movieId: String(movie.id)) { (trailers) in
            self.trailers = trailers
            self.tableViewDetails.reloadData()
        }
    }
    
    func getReviews(){
        let a = AlamofireHandeller()
        a.getReviews(movieId: String(self.movie.id)) { (reviews) in
            self.reviews = reviews
            self.tableViewDetails.reloadData()
        }
    }
}
