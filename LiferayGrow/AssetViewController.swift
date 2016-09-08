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
	

			let wikiTitle = page["title"] as! String
			
			let wikiContent = page["content"] as! String
			let templateHTML = NSBundle.mainBundle().pathForResource("template", ofType: "html")
			let content = try String(contentsOfFile: templateHTML!, encoding: NSUTF8StringEncoding)
			let contentWithTitle = content.stringByReplacingOccurrencesOfString("#title#", withString: wikiTitle, options: NSStringCompareOptions.LiteralSearch, range: nil)
			let contentWithCreole = contentWithTitle.stringByReplacingOccurrencesOfString("#content#", withString: wikiContent, options: NSStringCompareOptions.LiteralSearch, range: nil)

			let contentWithNewLine = contentWithCreole.stringByReplacingOccurrencesOfString("\n", withString: "<br />", options: NSStringCompareOptions.LiteralSearch, range: nil)
			
			print("Content:\(contentWithNewLine)")
			
			webView.loadHTMLString(contentWithNewLine, baseURL: NSURL(string: ""))
			//webView.stringByEvaluatingJavaScriptFromString("loadWikiPage()")
			
		} catch {
			print("Error : \(error)")
		}
		
		
        // Do any additional setup after loading the view.
    }
	
	
	@IBOutlet weak var webView: UIWebView!
	
	var peoplePlid = 34032;
	var learnPlid = 34262;
	var excellencePlid = 34766;
	var sharePlid = 34778;
	var asset: Asset!
	var session: LRSession?	
}
