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
		excellenceButton.layer.cornerRadius = 10
		excellenceButton.layer.borderColor = UIColor.whiteColor().CGColor
		excellenceButton.layer.borderWidth = 2

		learnButton.layer.cornerRadius = 10
		learnButton.layer.borderColor = UIColor.whiteColor().CGColor
		learnButton.layer.borderWidth = 2

		logoutButton.layer.cornerRadius = 10
		logoutButton.layer.borderColor = UIColor.whiteColor().CGColor
		logoutButton.layer.borderWidth = 2

		peopleButton.layer.cornerRadius = 10
		peopleButton.layer.borderColor = UIColor.whiteColor().CGColor
		peopleButton.layer.borderWidth = 2

		shareButton.layer.cornerRadius = 10
		shareButton.layer.borderColor = UIColor.whiteColor().CGColor
		shareButton.layer.borderWidth = 2
		
		UIGraphicsBeginImageContext(self.view.frame.size)
		UIImage(named: "background.jpg")?.drawInRect(self.view.bounds)
		
		let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
		
		UIGraphicsEndImageContext()
		
		self.view.backgroundColor = UIColor(patternImage: image)

	}

	@IBAction func logout(sender: AnyObject) {
		SessionContext.currentContext!.removeStoredCredentials()
		SessionContext.logout()
		
		self.performSegueWithIdentifier("ShowHomeScreen", sender: nil)
	}

	@IBOutlet weak var peopleButton: UIButton!
	@IBOutlet weak var learnButton: UIButton!
	@IBOutlet weak var excellenceButton: UIButton!
	@IBOutlet weak var shareButton: UIButton!
	@IBOutlet weak var logoutButton: UIButton!
	@IBOutlet var mainView: UIView!
	
	
	
}
