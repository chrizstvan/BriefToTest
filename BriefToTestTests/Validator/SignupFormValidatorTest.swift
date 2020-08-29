//
//  SignupFormValidator.swift
//  BriefToTestTests
//
//  Created by My Mac on 27/08/20.
//  Copyright © 2020 Christian Stevanus. All rights reserved.
//

import XCTest
@testable import BriefToTest

class SignupFormValidatorTest: XCTestCase {
    
    var sut: SignUpFormValidator!

    override func setUp() {
        sut = SignUpFormValidator()
    }

    override func tearDown() {
        sut = nil
    }

    func testSignUpFormValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        //Arrange / Given
        //let sut = SignUpFormValidator()
        
        //Act / When
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Chris")
        
        //Assert / Then
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have return TRUE for valid first name")
    }

    func testSignUpFormValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        //Arrange / Given
        //let sut = SignUpFormValidator()
        
        //Act / When
        let isFirstNameValid = sut.isFirstNameValid(firstName: "W")
        
        //Assert / Then
        XCTAssertFalse(isFirstNameValid, "the isFirstNameValid() should have return FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters")
        
    }
    
    func testSignUpFormValidator_WhenTooLongNameProvided_ShouldReturnFalse() {
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "ChrisChrisChris")
        
        //Assert
        XCTAssertFalse(isFirstNameValid, "the isFirstNameValid() should have return FALSE for a first name that is longer than \(SignupConstants.firstNameMaxLength) characters")
    }
    
    func testSignupFormValidator_WhenEqualPasswordProvided_ShouldReturnTrue() {
        //Act
        let doPasswordMatch = sut.doPasswordMatch(password: "12345", repeatPassword: "12345")
        
        //Assert
        XCTAssertTrue(doPasswordMatch, "the doPasswordMath() should have returned TRUE for matching passwords")
    }
    
    func testSignupFormValidator_WhenEqualPasswordProvided_ShouldReturnFalse() {
        //Act
        let doPasswordNotMatch = sut.doPasswordMatch(password: "12345", repeatPassword: "1235")
        
        //Assert
        XCTAssertFalse(doPasswordNotMatch, "the doPasswordMath() should have returned FALSE for not matching passwords")
    }
}
