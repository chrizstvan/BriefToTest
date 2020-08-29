//
//  ViewController.swift
//  BriefToTest
//
//  Created by My Mac on 27/08/20.
//  Copyright © 2020 Christian Stevanus. All rights reserved.
//

import UIKit

protocol SignupViewDelegate: AnyObject {
    func successfulSignup()
    func errorHandler(error: SignUpError)
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

