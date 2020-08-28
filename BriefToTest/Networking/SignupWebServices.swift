//
//  SignupWebServices.swift
//  BriefToTest
//
//  Created by My Mac on 28/08/20.
//  Copyright © 2020 Christian Stevanus. All rights reserved.
//

import Foundation

class SignupWebServices {
    
    private var urlSession: URLSession // injet because it will be mock / replaceable in test
    private var urlString: String
    
    init(urlString: String, session: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = session
    }
    
    func signUp(withForm form: SignupFormRequestViewModel, completion: @escaping (SignupFormResponseModel?, SignUpError?) -> Void) {
        guard let url = URL(string: urlString) else {
            //TODO: Create a unit test to test spesific error message is return when url is nil
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(form)
        
        urlSession.dataTask(with: request) { (data, response, error) in
            //TODO: Create unit test to handle success and error
            
            if let data = data, let signupResponse = try? JSONDecoder().decode(SignupFormResponseModel.self, from: data) {
                completion(signupResponse, nil)
            } else {
                //TODO: Create unit test to handle an error here
            }
            
        }.resume()
    }
}
