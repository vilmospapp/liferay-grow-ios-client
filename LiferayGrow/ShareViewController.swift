//
//  ShareViewController.swift
//  LiferayGrow
//
//  Created by Vilmos Papp on 02/09/16.
//  Copyright © 2016 Liferay Inc. All rights reserved.
//

import UIKit
import LiferayScreens

class ShareViewController: UIViewController, AssetListScreenletDelegate {
	
    override func viewDidLoad() {
        super.viewDidLoad()

		
		self.screenlet.delegate = self
		let assetQuery: [String: AnyObject] = [
			"allCategoryIds":[30838],
			"groupId":20147,
			"companyId":20166
		]
		
		self.screenlet.customEntryQuery = assetQuery

    }
    
	func screenlet(screenlet: AssetListScreenlet, onAssetSelected asset: Asset) {
		
		selectedAsset = asset
		performSegueWithIdentifier("ShowShareWikiPage", sender: nil)
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if (segue.identifier == "ShowShareWikiPage") {
			let vc = segue.destinationViewController as! AssetViewController;
			
			vc.asset = self.selectedAsset
		}
	}
	
	
	@IBOutlet weak var screenlet: AssetListScreenlet!
	
	var selectedAsset: Asset!
}
