//
//  CaseCountable.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

/**
    CaseCountable - extension provides mechanism for case count
*/

protocol CaseCountable {
    
    static func countCases() -> Int
    static var count: Int { get }
    
}

extension CaseCountable where Self: RawRepresentable, Self.RawValue == Int {

    static func countCases() -> Int {
        var count = 0
        while let _ = Self(rawValue: count) {
            count += 1
        }
        return count
    }
    
}
