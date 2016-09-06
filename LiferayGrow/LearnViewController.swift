//
//  LearnViewController.swift
//  LiferayGrow
//
//  Created by Vilmos Papp on 02/09/16.
//  Copyright © 2016 Liferay Inc. All rights reserved.
//

import UIKit
import LiferayScreens

class LearnViewController: UIViewController, AssetListScreenletDelegate {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.screenlet.delegate = self
		let assetQuery: [String: AnyObject] = [
			"allCategoryIds":[30836],
			"groupId":20147,
			"companyId":20166
		]
		
		self.screenlet.customEntryQuery = assetQuery
		
		// Do any additional setup after loading the view.
	}
	
	func screenlet(screenlet: AssetListScreenlet, onAssetSelected asset: Asset) {
		
		selectedAsset = asset
		performSegueWithIdentifier("ShowLearnWikiPage", sender: nil)
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if (segue.identifier == "ShowLearnWikiPage") {
			let vc = segue.destinationViewController as! AssetViewController;
			
			vc.asset = self.selectedAsset
		}
	}

	@IBOutlet weak var screenlet: AssetListScreenlet!
	var selectedAsset: Asset!
}
