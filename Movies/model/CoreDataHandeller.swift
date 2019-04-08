//
//  CoreDataHandeller.swift
//  Movies
//
//  Created by ashraf on 4/3/19.
//  Copyright © 2019 ashraf. All rights reserved.
//

import Foundation
import CoreData
import UIKit

struct CoreDataHandeller {
    let appDelegate : AppDelegate
    let managedContext : NSManagedObjectContext
    
    init() {
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    func addMovie(movie :Movie) {
        
        let entity = NSEntityDescription.entity(forEntityName: "FavouriteMovie", in: managedContext)!
        let favoritMovie = NSManagedObject(entity: entity, insertInto: managedContext)
        favoritMovie.setValue(movie.adult, forKey: "adult")
        favoritMovie.setValue(movie.id, forKey: "id")
        favoritMovie.setValue(movie.popularity, forKey: "popularity")
        favoritMovie.setValue(movie.posterPath, forKey: "posterPath")
        favoritMovie.setValue(movie.backdropPath, forKey: "backdropPath")
        favoritMovie.setValue(movie.originalLanguage, forKey: "originalLanguage")
        favoritMovie.setValue(movie.overview, forKey: "overview")
        favoritMovie.setValue(movie.releaseDate, forKey: "releaseDate")
        favoritMovie.setValue(movie.title, forKey: "title")
        favoritMovie.setValue(movie.originalTitle, forKey: "originalTitle")
        favoritMovie.setValue(movie.video, forKey: "video")
        favoritMovie.setValue(movie.voteAverage, forKey: "voteAverage")
        favoritMovie.setValue(movie.voteCount, forKey: "voteCount")
        do{
            try managedContext.save()
        }catch let error as NSError {
            print(error)
        }
    }
    func getMovies(updateView : ([Movie]) -> Void)  {
        var movies  = [Movie]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavouriteMovie")
        do {
            let fetchedMovies = try managedContext.fetch(fetchRequest)
            for item in fetchedMovies{
                let movie : Movie = Movie(voteCount: item.value(forKey: "voteCount") as! Int,
                                          id: item.value(forKey: "id") as! Int,
                                          video: true, voteAverage: item.value(forKey: "voteAverage") as! Double,
                                          title: (item.value(forKey: "title") as! String?)!,
                                          popularity: item.value(forKey: "popularity") as! Double,
                                          posterPath: (item.value(forKey: "posterPath")as! String?)!,
                                          originalLanguage: (item.value(forKey: "originalLanguage")as! String?)!,
                                          originalTitle: (item.value(forKey: "originalTitle")as! String?)!,
                                          genreIDS: [],
                                          backdropPath: (item.value(forKey: "backdropPath")as! String?)!,
                                          adult: (item.value(forKey: "adult") != nil),
                                          overview: (item.value(forKey: "overview")as! String?)!,
                                          releaseDate: (item.value(forKey: "releaseDate")as! String?)!)
                
                movies.append(movie)
            }
            updateView(movies)
        }catch{
            print("error in feching data")
        }
    }
    
    func isFavourite(movieId : Int) -> Bool{
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavouriteMovie")
        do {
            let fetchedMovies = try managedContext.fetch(fetchRequest)
            for item in fetchedMovies{
                if item.value(forKey: "id") as! Int == movieId {
                    return true
                }
            }
        }catch{
            print("error in feching data")
        }
        return false
    }
}
