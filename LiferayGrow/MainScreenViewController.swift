//
//  MainScreenViewController.swift
//  LiferayGrow
//
//  Created by Vilmos Papp on 30/08/16.
//  Copyright © 2016 Liferay Inc. All rights reserved.
//

import UIKit
import LiferayScreens

class MainScreenViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}

	@IBAction func logout(sender: AnyObject) {
		SessionContext.currentContext!.removeStoredCredentials()
		SessionContext.logout()
		
		self.performSegueWithIdentifier("ShowHomeScreen", sender: nil)
	}

}
