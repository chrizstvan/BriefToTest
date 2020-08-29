//
//  SignupPresenter.swift
//  BriefToTest
//
//  Created by My Mac on 29/08/20.
//  Copyright © 2020 Christian Stevanus. All rights reserved.
//

import Foundation

class SignupPresenter {
    
    private var formValidator: SignupValidatorProtocol
    
    init(validator: SignupValidatorProtocol) {
        self.formValidator = validator
    }
    
    func processUserSignup(form: SignupFormModel) {
        if !formValidator.isFirstNameValid(firstName: form.firstName) {
            return
        }
        
        if !formValidator.doPasswordMatch(password: form.password, repeatPassword: form.repeatPassword){
            return
        }
    }
}
