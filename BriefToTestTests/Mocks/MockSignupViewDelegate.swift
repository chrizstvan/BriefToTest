//
//  MockSignupViewDelegate.swift
//  BriefToTestTests
//
//  Created by My Mac on 29/08/20.
//  Copyright © 2020 Christian Stevanus. All rights reserved.
//

import Foundation
import XCTest
@testable import BriefToTest

class MockSignupViewDelegate: SignupViewDelegate {
        
    var expecation: XCTestExpectation?
    var successfulSignupCounter = 0
    var errorHandlerCounter = 0
    var signupError: SignUpError?
    
    func successfulSignup() {
        successfulSignupCounter += 1
        expecation?.fulfill()
    }
    
    func errorHandler(error: SignUpError) {
        signupError = error
        errorHandlerCounter += 1
        expecation?.fulfill()
    }
    
}
