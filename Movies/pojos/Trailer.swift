//
//  Trailer.swift
//  Movies
//
//  Created by ashraf on 3/31/19.
//  Copyright © 2019 ashraf. All rights reserved.
//

import Foundation
struct Welcome: Codable {
    let id: Int
    let videos: [Video]
    enum CodingKeys: String, CodingKey {
        case id
        case videos = "results"
    }
}
