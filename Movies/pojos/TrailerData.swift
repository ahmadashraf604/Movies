//
//  Trailer.swift
//  Movies
//
//  Created by ashraf on 3/31/19.
//  Copyright © 2019 ashraf. All rights reserved.
//

import Foundation

struct TrailerData: Codable {
    let id: Int
    let trailer: [Trailer]
    enum CodingKeys: String, CodingKey {
        case id
        case trailer = "results"
    }
}
