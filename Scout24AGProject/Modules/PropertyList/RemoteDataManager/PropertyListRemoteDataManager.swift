//
//  PropertyListRemoteDataManager.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 01/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation
import Swinject
import Alamofire
import Freddy
import Reachability

class PropertyListRemoteDataManager {

    private let reachability = Reachability()
    private var container: Container
    
    init(container: Container) {
        self.container = container
    }
    
}

extension PropertyListRemoteDataManager: PropertyListRemoteDataManagerType {
    func fetchPropertyListInfo(completion: @escaping (ServiceResult<PropertyListInfo>) -> Void) {
        let endpoint = PropertyListEndpoint.propertyList
        if reachability?.connection == .none {
            completion(.failure(error: Common.noInternetErrorDomain.localized))
        } else {
            Alamofire.request(endpoint).scout24AGProjectResponseJSON { (response) in
                switch response.result {
                case .success(let json):
                    do {
                        var propertyListRecord = [PropertyListRecord]()
                        try json.getArray(at: "items").forEach({ propertyListRecordJSON in
                            propertyListRecord.append(try PropertyListRecord(json: propertyListRecordJSON))
                        })
                        let propertyListInfo = PropertyListInfo(propertyRecordsArray: propertyListRecord)
                        completion(.success(responseObject: propertyListInfo))
                    } catch let error {
                        completion(.failure(error: error.localizedDescription))
                    }
                case .failure:
                    completion(.failure(error: Common.networkError.localized))
                }
            }
        }
    }

}
