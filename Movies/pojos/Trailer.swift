//
//  Trailer.swift
//  Movie
//
//  Created by ashraf on 3/31/19.
//  Copyright © 2019 ashraf. All rights reserved.
//

import Foundation

struct Trailer: Codable {
    let id, iso639_1, iso3166_1, key: String
    let name, site: String
    let size: Int
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case key, name, site, size, type
    }
}

