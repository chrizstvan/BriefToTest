//
//  SignupPresenterTest.swift
//  BriefToTestTests
//
//  Created by My Mac on 29/08/20.
//  Copyright © 2020 Christian Stevanus. All rights reserved.
//

import XCTest
@testable import BriefToTest

class SignupPresenterTest: XCTestCase {
    
    var signupFormModel: SignupFormModel!
    var mockSignupValidator: MockSignupValidator!
    var mockSignupWebService: MockSignupWebService!
    var mockSignUpViewDelegate: MockSignupViewDelegate!
    var sut: SignupPresenter!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        signupFormModel = SignupFormModel(firstName: "Student", lastName: "Udemy", email: "abc@def.com", password: "12345678", repeatPassword: "12345678")
        
        mockSignupValidator = MockSignupValidator()
        mockSignupWebService = MockSignupWebService()
        mockSignUpViewDelegate = MockSignupViewDelegate()
        
        sut = SignupPresenter(validator: mockSignupValidator, service: mockSignupWebService, delegate: mockSignUpViewDelegate)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        signupFormModel = nil
        mockSignupValidator = nil
        mockSignupWebService = nil
        mockSignUpViewDelegate = nil
    }
    
    func testSignupPresenter_WhenInformationProvidedByViewController_WillValidateEachProperty() {
        //Given
        
        //When
        sut.processUserSignup(form: signupFormModel)
        
        //Then
        XCTAssertTrue(mockSignupValidator.isFirstNameValidated, "first name was not validated")
        XCTAssertTrue(mockSignupValidator.isPasswordMatchAndValid, "did not validate if password match")
    }
    
    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        //Given
        
        //When
        sut.processUserSignup(form: signupFormModel)
        
        
        //Then
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "The signup() method was not called in the SignupWebService class")
    }

    func testSIgnupPresenter_WhenSignupOperationSuccessful_ShouldCallSuccessOnViewDelegate() {
        //Given
        let myExpectation = expectation(description: "successful sign up")
        mockSignUpViewDelegate.expecation = myExpectation
        
        //When
        sut.processUserSignup(form: signupFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        //Then
        XCTAssertEqual(mockSignUpViewDelegate.successfulSignupCounter, 1, "successfullSignUp() called mre than 1 times")
    }
    
    func testSignupPresenter_WhenSignupOperationFails_ShouldCalledErrorOnObjectDelegate() {
        //Given
        let errorHandleExpectation = expectation(description: "expect the errorHandler() to be called")
        mockSignUpViewDelegate.expecation = errorHandleExpectation
        mockSignupWebService.shouldReturnError = true
        
        //When
        sut.processUserSignup(form: signupFormModel)
        self.wait(for: [errorHandleExpectation], timeout: 5)
        
        //Then
        XCTAssertEqual(mockSignUpViewDelegate.successfulSignupCounter, 0)
        XCTAssertEqual(mockSignUpViewDelegate.errorHandlerCounter, 1)
        XCTAssertNotNil(mockSignUpViewDelegate.signupError)
    }
}
