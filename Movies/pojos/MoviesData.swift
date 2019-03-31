//
//  MoviesData.swift
//  Movies
//
//  Created by ashraf on 3/31/19.
//  Copyright © 2019 ashraf. All rights reserved.
//

import Foundation
struct MoviesData: Codable {
    let page, totalResults, totalPages: Int
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case movies = "results"
    }
}
