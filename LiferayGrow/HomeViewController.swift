//
//  HomeViewController.swift
//  LiferayGrow
//
//  Created by Vilmos Papp on 31/08/16.
//  Copyright © 2016 Liferay Inc. All rights reserved.
//

import UIKit
import LiferayScreens

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		if SessionContext.loadStoredCredentials() {
			print("load session from store")
		}
		else {
			print("No session stored")
		}
    }
	
	override func viewDidAppear(animated: Bool) {
		if !SessionContext.isLoggedIn {
			self.performSegueWithIdentifier("Login", sender: nil)
		}
		else {
			self.performSegueWithIdentifier("AutoLogin", sender: nil)
		}
	}
}