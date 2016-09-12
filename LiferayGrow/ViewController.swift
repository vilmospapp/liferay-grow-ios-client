//
//  ViewController.swift
//  LiferayGrow
//
//  Created by Vilmos Papp on 30/08/16.
//  Copyright © 2016 Liferay Inc. All rights reserved.
//

import UIKit
import LiferayScreens

class ViewController: UIViewController, LoginScreenletDelegate {

	@IBOutlet weak var loginScreenlet: LoginScreenlet!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.loginScreenlet.delegate = self
	}

	func screenlet(screenlet: BaseScreenlet,
	                        onLoginResponseUserAttributes attributes: [String:AnyObject]) {
		self.performSegueWithIdentifier("MainScreen", sender:nil)
	}
	
	func screenlet(screenlet: BaseScreenlet, onLoginError error: NSError) {
		print(error)
	}
	
	func onScreenletCredentialsSaved(screenlet: BaseScreenlet) {
		
	}
	
	func onScreenletCredentialsLoaded(screenlet: BaseScreenlet) {
		
	}

}

