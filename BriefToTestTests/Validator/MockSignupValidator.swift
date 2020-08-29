//
//  MockSignupValidator.swift
//  BriefToTestTests
//
//  Created by My Mac on 29/08/20.
//  Copyright © 2020 Christian Stevanus. All rights reserved.
//

import Foundation
@testable import BriefToTest

class MockSignupValidator: SignupValidatorProtocol {
    
    var isFirstNameValidated: Bool = false
    var isPasswordMatchAndValid: Bool = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
        isPasswordMatchAndValid = true
        return isPasswordMatchAndValid
    }
    
}
