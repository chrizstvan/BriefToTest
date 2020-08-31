//
//  MockSignupPresenter.swift
//  BriefToTestTests
//
//  Created by My Mac on 29/08/20.
//  Copyright © 2020 Christian Stevanus. All rights reserved.
//

import Foundation
@testable import BriefToTest

class MockSignupPresenter: SignupPresenterProtocol {
    
    var processUserSignUpCalled = false
    
    required init(validator: SignupValidatorProtocol, service: SignupWebServiceProtocol, delegate: SignupViewDelegate) {
        //TODO:
    }
    
    func processUserSignup(form: SignupFormModel) {
        processUserSignUpCalled = true
    }
    
}
