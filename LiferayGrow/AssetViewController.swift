//
//  AssetViewController.swift
//  LiferayGrow
//
//  Created by Vilmos Papp on 01/09/16.
//  Copyright © 2016 Liferay Inc. All rights reserved.
//

import UIKit
import LiferayScreens
import LRMobileSDK


class AssetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		let name="Grow"
		
		session = SessionContext.createSessionFromCurrentSession()
		
		let wikiContentService = LRWikicontentService_v7(session: session)
		let wikiNodeService = LRWikiNodeService_v7(session: session)
		let wikiPageService = LRWikiPageService_v7(session: session)

		do {
			let node = try wikiNodeService.getNodeWithGroupId(asset!.groupId, name: name)
		
			let nodeId = node["nodeId"] as! String
			
			let page = try wikiPageService.getPageWithGroupId(asset!.groupId, nodeId: nodeId.asLong!, title: asset!.title)

			let width = self.webView.frame.width-20;

			let wikiTitle = page["title"] as! String
			let format = page["format"] as! String
			
			let wikiContent = try wikiContentService.getRenderedWikiPageWithSiteUrl(growSite, plid: Int64(width), groupId: growGroupId, nodeId: nodeId.asLong!, name: wikiTitle)
			let templateHTML = NSBundle.mainBundle().pathForResource("template", ofType: "html")
			let content = try String(contentsOfFile: templateHTML!, encoding: NSUTF8StringEncoding)
			let contentWithTitle = content.stringByReplacingOccurrencesOfString("#title#", withString: wikiTitle, options: NSStringCompareOptions.LiteralSearch, range: nil)
			
			if format == "creole" {
				let parsedContent = contentWithTitle.stringByReplacingOccurrencesOfString("#content#", withString: wikiContent, options: NSStringCompareOptions.LiteralSearch, range: nil)

				renderedContent = parsedContent
			}
			else {
				renderedContent = wikiContent
			}
			
			//Debug
			print("Content:\(renderedContent)")
			
			webView.loadHTMLString(renderedContent, baseURL: NSURL(string:LiferayServerContext.server))
		} catch {
			print("Error : \(error)")
		}
    }
	
	
	@IBOutlet weak var webView: UIWebView!
	
	var renderedContent: String = ""
	var growSite = "https://grow.liferay.com"
	var growGroupId: Int64 = 20147
	var asset: Asset!
	var session: LRSession?

}
