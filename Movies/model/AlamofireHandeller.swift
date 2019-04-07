//
//  AlamofireHandeller.swift
//  Movies
//
//  Created by ashraf on 4/1/19.
//  Copyright © 2019 ashraf. All rights reserved.
//

import Foundation
import Alamofire

struct AlamofireHandeller {
    
    private let dicover = "/discover"
    private let movie = "/movie"
    private let basicURL = "https://api.themoviedb.org/3"
    private let key = "api_key=e07070a3952fcf18a91b6d1aaf196f8c"
    private let videos = "/videos"
    private let reviews = "/reviews"
    
    public func getMovies(updateView : @escaping ([Movie]) -> Void){
        let url = "\(basicURL)\(dicover)\(movie)?\(key)"
        Alamofire.request(url).responseJSON { (responseObject) -> Void in
            
            if responseObject.result.isSuccess {
                let moviesData = try! JSONDecoder().decode(MoviesData.self, from: responseObject.data!)
                updateView(moviesData.movies)
            }
        }
    }
    
    public func getTrailers(movieId : String,updateView : @escaping ([Trailer]) -> Void){
        let url = "\(basicURL)\(movie)/\(movieId)\(videos)?\(key)"
        Alamofire.request(url).responseJSON { (responseObject) -> Void in
            if responseObject.result.isSuccess {
                let trailerData = try! JSONDecoder().decode(TrailerData.self, from: responseObject.data!)
                updateView(trailerData.trailer)
            }
        }
    }
    
    public func getReviews(movieId : String,updateView : @escaping ([Review]) -> Void){
        let url = "\(basicURL)\(movie)/\(movieId)\(reviews)?\(key)"
        Alamofire.request(url).responseJSON { (responseObject) -> Void in
            if responseObject.result.isSuccess {
                let reviewData = try! JSONDecoder().decode(ReviewData.self, from: responseObject.data!)
                updateView(reviewData.reviews)
            }
        }
    }
    
    
    
}
