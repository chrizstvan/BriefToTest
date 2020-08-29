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
    private var webService: SignupWebServiceProtocol
    private var viewDelegate: SignupViewDelegate
    
    init(validator: SignupValidatorProtocol, service: SignupWebServiceProtocol, delegate: SignupViewDelegate) {
        self.formValidator = validator
        self.webService = service
        self.viewDelegate = delegate
    }
    
    func processUserSignup(form: SignupFormModel) {
        if !formValidator.isFirstNameValid(firstName: form.firstName) {
            return
        }
        
        if !formValidator.doPasswordMatch(password: form.password, repeatPassword: form.repeatPassword){
            return
        }
        
        //webservice
        let postForm = SignupFormRequestViewModel(firstName: form.firstName, lastName: form.lastName, email: form.email, password: form.password)
        webService.signUp(withForm: postForm) { [weak self] (responseVM, error) in
            //TODO: Implement pas data to view delegate
            
            if let error = error {
                self?.viewDelegate.errorHandler(error: error)
                return
            }
            
            if let response = responseVM {
                self?.viewDelegate.successfulSignup()
                return
            }
        }
    }
    
}
