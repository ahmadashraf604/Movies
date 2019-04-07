//
//  ReviewData.swift
//  Movies
//
//  Created by ashraf on 4/5/19.
//  Copyright © 2019 ashraf. All rights reserved.
//

import Foundation

struct ReviewData: Codable {
    let id, page: Int
    let reviews: [Review]
    let totalPages, totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case id, page
        case reviews = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
