//
//  SignUpFormValidator.swift
//  BriefToTest
//
//  Created by My Mac on 27/08/20.
//  Copyright © 2020 Christian Stevanus. All rights reserved.
//

import Foundation

protocol SignupValidatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool
}

class SignUpFormValidator: SignupValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = firstName.isEmpty ? false : true
        returnValue = firstName .count < SignupConstants.firstNameMinLength
            || firstName.count > SignupConstants.firstNameMaxLength ? false : true
        
        return returnValue
    }
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
}
