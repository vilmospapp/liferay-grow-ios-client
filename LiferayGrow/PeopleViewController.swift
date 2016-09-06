//
//  PeopleViewController.swift
//  LiferayGrow
//
//  Created by Vilmos Papp on 31/08/16.
//  Copyright © 2016 Liferay Inc. All rights reserved.
//

import UIKit
import LiferayScreens


class PeopleViewController: UIViewController, AssetListScreenletDelegate {
	
	override func viewDidLoad() {
        super.viewDidLoad()

		self.screenlet.delegate = self
		let assetQuery: [String: AnyObject] = [
			"allCategoryIds":[30835],
			"groupId":20147,
			"companyId":20166
		]
		
		self.screenlet.customEntryQuery = assetQuery

       // Do any additional setup after loading the view.
    }

	func screenlet(screenlet: AssetListScreenlet, onAssetSelected asset: Asset) {
		
		selectedAsset = asset
		performSegueWithIdentifier("ShowPeopleWikiPage", sender: nil)
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if (segue.identifier == "ShowPeopleWikiPage") {
			let vc = segue.destinationViewController as! AssetViewController;
			
			vc.asset = self.selectedAsset
		}
	}

	@IBOutlet weak var screenlet: AssetListScreenlet!
	var selectedAsset: Asset!

}
