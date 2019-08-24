//
//  PropertyListEntity.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 01/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation
import Freddy

struct PropertyListRecord {
    let id: Int
    let title: String
    let price: Double
    var isFavourite: Bool
    var imagesArray = [Image]()
    let location: Location?
    
    init(id: Int, title: String, price: Double, isFavourite: Bool, images: [Image], location: Location?) {
        self.id = id
        self.title = title
        self.price = price
        self.isFavourite = isFavourite
        self.imagesArray.append(contentsOf: images)
        self.location = location
    }
    
    init() {
        self.id = -1
        self.title = ""
        self.price = 0.0
        self.isFavourite = false
        self.location = nil
    }
}

extension PropertyListRecord: JSONDecodable {
    
    init(json: JSON) throws {
        id = try json.getInt(at: "id")
        title = try json.getString(at: "title")
        price = try json.getDouble(at: "price")
        isFavourite = false
        location = try Location(json: JSON(try json.getDictionary(at: "location")))
        guard json["images"] != nil, let images = try json.getArray(at: "images") as Array? else { return }
        try images.forEach { image in
            guard let id = try image.getInt(at: "id") as Int?, let url = try image.getString(at: "url") as String? else { return }
            self.imagesArray.append(Image(id: id, url: url))
        }
    }
    
}
