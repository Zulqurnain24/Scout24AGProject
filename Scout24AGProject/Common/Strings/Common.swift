//
//  Common.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

enum Common: String {

    case notLoggedInHeaderTitle = "NOT_LOGGED_IN_HEADER_TITLE"
    case notLoggedInButtonTitle = "NOT_LOGGED_IN_BUTTON_TITLE"
    case notLoggedInSubtitle = "NOT_LOGGED_IN_SUBTITLE"
    case notLoggedInSignInButtonTitle = "NOT_LOGGED_IN_SIGN_IN_BUTTON_TITLE"

    // Reachablity
    
    case noInternetMessage = "NO_INTERNET_CONNECTION"
    case noInternetErrorDomain = "UNREACHABLE"
    
    // NetworkError
    case dataRetrieveFailed = "DATA_RETRIEVAL_ERROR"
    case apiCannotAuthenticate = "API_CANNOT_AUTHENTICATE"
    case networkError = "NETWORK_ERROR"
    case badConnectTitle = "BAD_CONNECTION_TITLE"
    case badConnectText = "BAD_CONNECTION_TEXT"
    case badConnectionStartOver = "BAD_CONNECTION_GIVE_UP"
    case badConnectionAlertTitle = "BAD_CONNECTION_ALERT_TITLE"
    case badConnectionAlertMessage = "BAD_CONNECTION_ALERT_MESSAGE"
    case badConnectionAlertButtonTitle = "BAD_CONNECTION_ALERT_BUTTON_TITLE"
    
    // General Error
    case generalErrorTitle = "GENERAL_ERROR_TITLE"
    case generalErrorText = "GENERAL_ERROR_TEXT"
    case retryButtonTitle = "RETRY_BUTTON_TITLE"
    case serviceFailure = "SERVICE_FAILURE"
    case continueButtonTitle = "CONTINUE_BUTTON_TITLE"
    
}

extension Common: StringLocalizable {
    
    var localized: String {
        return self.rawValue.localized(fromTable: "\(type(of: self))")
    }
    
}
