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

    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testSignupWebService_WhenGivenSuccessfulResponse_ShouldReturnTrue() {
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        //Arrange
        let sut = SignupWebServices(urlString: "http://appsdeveloperblog.com:8080/signup-mock-service/users", session: urlSession)
        let signupFormRequestVM = SignupFormRequestViewModel(firstName: "student", lastName: "udemy", email: "test@abc.com", password: "123456")
        
        let expectation = self.expectation(description: "Sign up webservices response expextation")
        
        //Act
        sut.signUp(withForm: signupFormRequestVM) { signupResponseModel, error in
            //Assert
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }

}
