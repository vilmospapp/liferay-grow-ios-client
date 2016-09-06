/**
* Copyright (c) 2000-present Liferay, Inc. All rights reserved.
*
* This library is free software; you can redistribute it and/or modify it under
* the terms of the GNU Lesser General Public License as published by the Free
* Software Foundation; either version 2.1 of the License, or (at your option)
* any later version.
*
* This library is distributed in the hope that it will be useful, but WITHOUT
* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
* FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
* details.
*/

import Foundation
import LiferayScreens

@objc public protocol WikiPageDisplayScreenletDelegate : BaseScreenletDelegate {
	
	optional func screenlet(screenlet: WikiPageDisplayScreenlet,
	                        onWikiPageResponse wikiPage: WikiPage)
	
	optional func screenlet(screenlet: WikiPageDisplayScreenlet,
	                        onWikiPageError error: NSError)
}


public class WikiPageDisplayScreenlet: BaseScreenlet {
	
	@IBInspectable public var assetEntryId: Int64 = 0
	
	@IBInspectable public var classPK: Int64 = 0
	
	@IBInspectable public var autoLoad: Bool = true
	
	public class var supportedMimeTypes: [String] {
		return ["text/html"]
	}
	
	public var wikiPage: WikiPage? {
		didSet {
			wikiPageViewModel?.wikiPage = self.wikiPage
		}
	}
	
	public var wikiPageDisplayDelegate: WikiPageDisplayScreenletDelegate? {
		return delegate as? WikiPageDisplayScreenletDelegate
	}
	
	public var wikiPageViewModel: WikiDisplayViewModel? {
		return screenletView as? WikiDisplayViewModel
	}
	
	//MARK: Public methods
	
	override public func onShow() {
		if autoLoad {
			load()
		}
	}
	
		public func load() -> Bool {
		return self.performDefaultAction()
	}
}
