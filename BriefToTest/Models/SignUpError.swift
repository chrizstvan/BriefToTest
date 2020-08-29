//
//  SignUpError.swift
//  BriefToTest
//
//  Created by My Mac on 28/08/20.
//  Copyright © 2020 Christian Stevanus. All rights reserved.
//

import Foundation

enum SignUpError: LocalizedError, Equatable {
    case responseModelParsingError
    case invalidRequestURLStringError
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(description: let description):
            return description
        case .responseModelParsingError, .invalidRequestURLStringError :
            return ""
        }
    }
}
