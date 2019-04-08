//
//  DetailsViewController.swift
//  Movies
//
//  Created by ashraf on 3/31/19.
//  Copyright © 2019 ashraf. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var btnTrailer: UIButton!
    @IBOutlet weak var btnReview: UIButton!
    @IBOutlet weak var btnFavourite: UIBarButtonItem!
    @IBOutlet weak var titleDetails: UILabel!
    @IBOutlet weak var releaseYearDetails: UILabel!
    @IBOutlet weak var imageDetails: UIImageView!
    @IBOutlet weak var reviewsDetails: UILabel!
    @IBOutlet weak var tableViewDetails: UITableView!
    
    var trailers : [Trailer] = []
    var reviews : [Review] = []
    var trailerAppear : Bool = true
    var movie : Movie!
    var isFavourite : Bool!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleDetails.text = movie.title
        releaseYearDetails.text = movie.releaseDate
        reviewsDetails.text = movie.overview
        let imageUrl = URL(string: "https://image.tmdb.org/t/p/w185/\(movie.posterPath)")
        imageDetails.sd_setImage(with: imageUrl, completed: nil)
        self.getTrailers()
        if isFavourite {
            btnFavourite.setBackgroundImage(UIImage(named : "heartFill"), for: .normal, barMetrics: .default)
        }else{
            btnFavourite.setBackgroundImage(UIImage(named : "heart"), for: .normal, barMetrics: .default)
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
            UIApplication.shared.openURL(youtubeUrl as URL)
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
            CoreDataHandeller().addMovie(movie: movie)
            btnFavourite.setBackgroundImage(UIImage(named : "heartFill"), for: .normal, barMetrics: .default)
            isFavourite = false
        }else{
            
            btnFavourite.setBackgroundImage(UIImage(named : "heartFill"), for: .normal, barMetrics: .default)
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
