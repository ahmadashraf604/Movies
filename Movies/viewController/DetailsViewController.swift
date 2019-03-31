//
//  DetailsViewController.swift
//  Movies
//
//  Created by ashraf on 3/31/19.
//  Copyright © 2019 ashraf. All rights reserved.
//

import UIKit
import Alamofire

class DetailsViewController: UIViewController {
    var movie : Movie!
    
    @IBOutlet weak var titleDetails: UILabel!
    @IBOutlet weak var releaseYearDetails: UILabel!
    @IBOutlet weak var imageDetails: UIImageView!
    @IBOutlet weak var reviewsDetails: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleDetails.text = movie.title
        releaseYearDetails.text = movie.releaseDate
        reviewsDetails.text = movie.overview
        let imageUrl = URL(string: "https://image.tmdb.org/t/p/w185/\(movie.posterPath)")
        imageDetails.sd_setImage(with: imageUrl, completed: nil)
        
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
