//
//  SignupWebServicesTest.swift
//  BriefToTestTests
//
//  Created by My Mac on 28/08/20.
//  Copyright © 2020 Christian Stevanus. All rights reserved.
//

import XCTest
@testable import BriefToTest

class SignupWebServicesTest: XCTestCase {

    var sut: SignupWebServices!
    var signupFormRequestVM: SignupFormRequestViewModel!
    
    override func setUp() {
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SignupWebServices(urlString: SignupConstants.signUpUrl, session: urlSession)
        signupFormRequestVM = SignupFormRequestViewModel(firstName: "student", lastName: "udemy", email: "test@abc.com", password: "123456")
    }
    
    override func tearDown() {
        sut = nil
        signupFormRequestVM = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }
    
    func testSignupWebService_WhenGivenSuccessfulResponse_ReturnSuccess() {
        
        //Arrange
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Sign up webservices response expextation")
        
        //Act
        sut.signUp(withForm: signupFormRequestVM) { signupResponseModel, error in
            //Assert
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenRecievedDiffrentJSONResponse_ErrorTookPlace() {
        
        //Arrange
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signip() method expextation for a response that contains a diffrent JSON structure")
        
        //Act
        sut.signUp(withForm: signupFormRequestVM) { signupResponseModel, error in
            //Assert
            XCTAssertNil(signupResponseModel, "the response model for request containing unknown JSON response, should have been nil")
            XCTAssertEqual(error, SignUpError.responseModelParsingError, "Signup() method did not return expected error")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenEmptyURLStringProvided_ReturnsError() {
        
        //Arange
        let expectation = self.expectation(description: "An empty request URL string expectation")
        sut = SignupWebServices(urlString: "")
        
        //Act
        sut.signUp(withForm: signupFormRequestVM) { (signupResponseModel, error) in
            //Assert
            XCTAssertEqual(error, SignUpError.invalidRequestURLStringError, "the signup() method did not return an expected error for an invalidRequestURLString error")
            XCTAssertNil(signupResponseModel, "When an invalidRequestURLString takes place, the response model must be nil")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testSignupWebService_WhenURLRequestFails_ReturnErrorMessageDescription() {
        //Arange
        let expectation = self.expectation(description: "A failed request expectation")
        let errorDescription = "A localized description of an error"
        MockURLProtocol.error = SignUpError.failedRequest(description: errorDescription)
        
        //Act
        sut.signUp(withForm: signupFormRequestVM) { (signupResponseModel, error) in
            //Assert
            XCTAssertEqual(error, SignUpError.failedRequest(description: errorDescription), "the signup() method did not return an expected error for the failed request")
            //XCTAssertEqual(error?.localizedDescription, errorDescription)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }

}
