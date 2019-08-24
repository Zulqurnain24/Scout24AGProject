//
//  image.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 02/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation
import Freddy
import CoreLocation

struct Image {
    let id: Int
    let url: String?
    
    init(id: Int, url: String) {
        self.id = id
        self.url = url
    }
}

extension Image: JSONDecodable {
    
    init(json: JSON) throws {
        id = try json.getInt(at: "id")
        url = try json.getString(at: "url")
    }
    
}

