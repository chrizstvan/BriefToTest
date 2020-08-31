//
//  SignupViewControllerTest.swift
//  BriefToTestTests
//
//  Created by My Mac on 29/08/20.
//  Copyright © 2020 Christian Stevanus. All rights reserved.
//

import XCTest
@testable import BriefToTest

class SignupViewControllerTest: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: SignUpViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SignUpViewController") as SignUpViewController
        
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        storyboard = nil
        sut = nil
    }
    
    func testSignUpViewController_WhenCreated_HasRequiredTextFieldEmpty() throws {
        
        let userFirstNameTextField = try XCTUnwrap(sut.userFirstNameTextField, "the firstNameTextField is not connected to an IBOutlet")
        
        //Then
        XCTAssertEqual(userFirstNameTextField.text, "", "first name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(sut.userLastnameTextField.text, "", "last name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(sut.emailTextField.text, "", "email text field was not empty when the view controller initialy loaded")
        XCTAssertEqual(sut.passwordTextField.text, "", "password text field was not empty when the view controller initially loaded")
        XCTAssertEqual(sut.repeatPasswordTextField.text, "", "repeat pasword text field was not empty when the view controller initially loaded")
    }
    
    func testSignupViewController_WhenCreated_HasSignupButtonAndAction() throws {
        //Given
        let signUpButton: UIButton = try XCTUnwrap(sut.signupButton, "sign up button is not connected to IBOutlet")
        //When
        let signupButtonAction = try XCTUnwrap(signUpButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Sign up button does not have any actions assigned to it")
        //Then
        XCTAssertEqual(signupButtonAction.count, 1, "sign up button not have any action asigned")
        XCTAssertEqual(signupButtonAction.first, "signupButtonTapped:", "There is no action with a name signupButtonTapped assigned to signup button")
    }
    
    func testSignupViewController_WhenSignupButtonTapped_InvokesSignupProcess() {
        //Given
        let mockSignupValidator = MockSignupValidator()
        let mockSignupWebService = MockSignupWebService()
        let mockSignupViewDelegate = MockSignupViewDelegate()
        
        let mockSignupPresenter = MockSignupPresenter(validator: mockSignupValidator, service: mockSignupWebService, delegate: mockSignupViewDelegate)
        
        sut.signupPresenter = mockSignupPresenter
        
        //When
        sut.signupButton.sendActions(for: .touchUpInside)
        
        //Then
        XCTAssertTrue(mockSignupPresenter.processUserSignUpCalled, "processUserSignUpCalled was not called on Presenter")
    }

}
