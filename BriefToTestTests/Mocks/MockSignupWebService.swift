//
//  MockSignupWebService.swift
//  BriefToTestTests
//
//  Created by My Mac on 29/08/20.
//  Copyright © 2020 Christian Stevanus. All rights reserved.
//

import Foundation
@testable import BriefToTest

class MockSignupWebService: SignupWebServiceProtocol {
    
    var isSignupMethodCalled = false
    var shouldReturnError = false
    
    func signUp(withForm form: SignupFormRequestViewModel, completion: @escaping (SignupFormResponseModel?, SignUpError?) -> Void) {
        isSignupMethodCalled = true
        
        if shouldReturnError {
            completion(nil, SignUpError.failedRequest(description: "Sign up request was not successful"))
        } else {
            let responseModel = SignupFormResponseModel(status: "ok")
            completion(responseModel, nil)
        }
    }
    
    
}
