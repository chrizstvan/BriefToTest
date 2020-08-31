//
//  SignUpViewController.swift
//  BriefToTest
//
//  Created by My Mac on 29/08/20.
//  Copyright © 2020 Christian Stevanus. All rights reserved.
//

import UIKit

protocol SignupViewDelegate: AnyObject {
    func successfulSignup()
    func errorHandler(error: SignUpError)
}

class SignUpViewController: UIViewController {

    @IBOutlet weak var userFirstNameTextField: UITextField!
    @IBOutlet weak var userLastnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    var signupPresenter: SignupPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if signupPresenter == nil {
            let validator = SignUpFormValidator()
            let service = SignupWebServices(urlString: SignupConstants.signUpUrl)
            
            signupPresenter = SignupPresenter(validator: validator, service: service, delegate: self)
        }
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        let form = SignupFormModel(firstName: userFirstNameTextField.text ?? "",
                                   lastName: userLastnameTextField.text ?? "",
                                   email: emailTextField.text ?? "",
                                   password: passwordTextField.text ?? "",
                                   repeatPassword: repeatPasswordTextField.text ?? "")
        signupPresenter?.processUserSignup(form: form)
    }

}

extension SignUpViewController: SignupViewDelegate {
    func successfulSignup() {
        //TODO:
    }
    
    func errorHandler(error: SignUpError) {
        //TODO:
    }
    
    
}
