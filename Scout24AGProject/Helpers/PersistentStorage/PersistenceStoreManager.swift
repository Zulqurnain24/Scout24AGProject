//
//  UserDefaults.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 02/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

class PersistenceStoreManager {
    static let shared: PersistenceStoreManager = PersistenceStoreManager()
    let userDefaults = UserDefaults.standard
    
    func getArray<T>(name: String) -> [T]? {
        guard let array = userDefaults.array(forKey: name) as! [T]? else { return [] }
        return array
    }
    
    func setArray(key: String, value: Array<Any>) {
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }
}
