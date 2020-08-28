//
//  SignupFormRequestModel.swift
//  BriefToTest
//
//  Created by My Mac on 28/08/20.
//  Copyright © 2020 Christian Stevanus. All rights reserved.
//

import Foundation

struct SignupFormRequestViewModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
