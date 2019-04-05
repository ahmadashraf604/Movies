//
//  DetailsViewController.swift
//  Movies
//
//  Created by ashraf on 3/31/19.
//  Copyright © 2019 ashraf. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDataSource,UITableViewDelegate{
    
    var movie : Movie!
    
    @IBOutlet weak var titleDetails: UILabel!
    @IBOutlet weak var releaseYearDetails: UILabel!
    @IBOutlet weak var imageDetails: UIImageView!
    @IBOutlet weak var reviewsDetails: UILabel!
    @IBOutlet weak var tableViewDetails: UITableView!
    var trailers:[Trailer] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleDetails.text = movie.title
        releaseYearDetails.text = movie.releaseDate
        reviewsDetails.text = movie.overview
        let imageUrl = URL(string: "https://image.tmdb.org/t/p/w185/\(movie.posterPath)")
        imageDetails.sd_setImage(with: imageUrl, completed: nil)
        let a = AlamofireHandeller()
            a.getTrailers(movieId: "299537") { (trailers) in
            self.trailers = trailers
            self.tableViewDetails.reloadData()
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trailers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableViewDetails.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = trailers[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let  youtubeUrl = NSURL(string:"https://www.youtube.com/watch?v=\(trailers[indexPath.row].key)")!
        UIApplication.shared.openURL(youtubeUrl as URL)

    }
    
    @IBAction func addFavourite(_ sender: UIButton) {
        print("Add movie to favourite")
        CoreDataHandeller().addMovie(movie: movie)
    }
}
