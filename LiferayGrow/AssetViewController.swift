//
//  AssetViewController.swift
//  LiferayGrow
//
//  Created by Vilmos Papp on 01/09/16.
//  Copyright © 2016 Liferay Inc. All rights reserved.
//

import UIKit
import LiferayScreens


class AssetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		let name="Grow"
		
		session = SessionContext.createSessionFromCurrentSession()
		
		let wikiNodeService = LRWikiNodeService_v7(session: session)
		let wikiPageService = LRWikiPageService_v7(session: session)

		do {
			let node = try wikiNodeService.getNodeWithGroupId(asset!.groupId, name: name)
		
			let nodeId = node["nodeId"] as! String
			
			let page = try wikiPageService.getPageWithGroupId(asset!.groupId, nodeId: nodeId.asLong!, title: asset!.title)
	

			let wikiTitle = page["title"] as! String + "\r\n\r\n"
			
			let attrs = [NSFontAttributeName : UIFont.boldSystemFontOfSize(22)]
	
			boldString = NSMutableAttributedString(string:wikiTitle, attributes:attrs)

			
			let content = page["content"] as! String
			
			attributedContent = NSMutableAttributedString(string:content)
			wikiContent.attributedText = boldString
			
			let finalContent: NSMutableAttributedString = wikiContent.attributedText.mutableCopy() as! NSMutableAttributedString
				
			finalContent.appendAttributedString(attributedContent)
			
			wikiContent.attributedText = finalContent.copy() as! NSAttributedString
		} catch {
			print("Error : \(error)")
		}
		
		
        // Do any additional setup after loading the view.
    }
	
	@IBOutlet weak var wikiContent: UITextView!

	var boldString: NSMutableAttributedString!
	var attributedContent: NSMutableAttributedString!
	var asset: Asset!
	var session: LRSession?	
}
