//
//  PropertyListInteractor.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 01/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//


import Foundation

class PropertyListInteractor {
    
    private var remoteDataManager: PropertyListRemoteDataManagerType?
    
    required init(remoteDataManager: PropertyListRemoteDataManagerType) {
        self.remoteDataManager = remoteDataManager
    }
    
}

extension PropertyListInteractor: PropertyListInteractorType {
    func fetchPropertyListInfo(completion: @escaping (ServiceResult<PropertyListInfo>) -> Void) {
        remoteDataManager?.fetchPropertyListInfo(completion: completion)
    }

}

