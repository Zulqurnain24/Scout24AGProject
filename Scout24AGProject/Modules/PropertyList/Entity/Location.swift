//
//  Location.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 01/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import Freddy
import CoreLocation

struct Location {
    let address: String
    let cordinates: CLLocation?
    
    init(address: String, cordinates: CLLocation) {
        self.address = address
        self.cordinates = cordinates
    }
}

extension Location: JSONDecodable {
    
    init(json: JSON) throws {
        address = try json.getString(at: "address")
        guard let latitude = try json.getDouble(at: "latitude") as Double?, let longitude = try json.getDouble(at: "longitude") as Double? else {
            cordinates = nil
            return }
        cordinates = CLLocation(latitude: CLLocationDegrees(exactly: latitude)!, longitude: CLLocationDegrees(exactly: longitude)!)
    }
    
}
