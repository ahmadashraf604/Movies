//
//  ViewController.swift
//  Movies
//
//  Created by ashraf on 3/30/19.
//  Copyright © 2019 ashraf. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage



class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        
//        super.viewDidLoad()
//        let strURL = "https://api.themoviedb.org/3/discover/movie?api_key=e07070a3952fcf18a91b6d1aaf196f8c"
//
//        Alamofire.request(strURL).responseJSON { (responseObject) -> Void in
//
//
//            if responseObject.result.isSuccess {
//                let moviesData = try! JSONDecoder().decode(MoviesData.self, from: responseObject.data!)
//                for movie in moviesData.movies{
//                    print("\(movie.id) \(movie.title)")
//                }
//                let imageUrl = URL(string: "https://image.tmdb.org/t/p/w185/\(moviesData.movies[0].posterPath)")
//                self.imageView.sd_setImage(with: imageUrl, completed: nil)
//            }
//            //            if responseObject.result.isFailure {
//            //                let error : NSError = responseObject.result.error!
//            //                failure(error)
//            //            }
//
//
//        }
        
//        let remoteImageURL = URL(string: "https://solarianprogrammer.com/images/2013/02/28/mandelbrot_piece_Z2.png")!
//
//        self.imageView.sd_setImage(with: remoteImageURL, completed: nil)
        // The image to dowload//
//        // Use Alamofire to download the image
//        Alamofire.request(remoteImageURL).responseData { (response) in
//            if response.error == nil {
//                print(response.result)
//
//                // Show the downloaded image:
//                if let data = response.data {
//                    self.imageView.image = UIImage(data: data)
//                }
//            }
//        }
        
//        let core = CoreDataHandeller()
//        let movie = Movie(voteCount: 5, id: 5, video: true, voteAverage: 5.5, title: "dfsd", popularity: 5.2, posterPath: "dfsd", originalLanguage: "dfsd", originalTitle: "asdfdas", genreIDS: [3,5], backdropPath: "dasd", adult: true, overview: "adsa", releaseDate: "asdas")
//        
//        core.addMovie(movie: movie)
//        core.getMovies { (m) in
//            
//        }
    }
    
    
}

