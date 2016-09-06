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
import UIKit
import LiferayScreens

public class WikiPageDisplayView_default: BaseScreenletView, WikiDisplayViewModel {
	
	@IBOutlet weak var title: UILabel!
	@IBOutlet weak var content: UILabel!
		
	public var contentStyle = "font-size:17"
	public var headerImageHeight: CGFloat = 125.0
	
	private let dateFormatter: NSDateFormatter = {
		let dateFormatter = NSDateFormatter()
		dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
		dateFormatter.locale = NSLocale(
			localeIdentifier: NSLocale.currentLocaleString)
		return dateFormatter
	}()
	
	private var selectedWikiPage: WikiPage?
	
	public var wikiPage: WikiPage? {
		didSet {
			if let wikiPage = wikiPage {
				self.selectedWikiPage = wikiPage
				self.setTitle()
				self.setContent()
			}
		}
	}
	
	private func setTitle() {
		title?.text = self.selectedWikiPage?.title
	}

	private func setContent() {
		let contentText = "<span style=\"\(contentStyle)\">\(self.selectedWikiPage!.content)</span>"
		
		let encodedData = contentText.dataUsingEncoding(NSUTF8StringEncoding)!
		let attributedOptions : [String: AnyObject] = [
			NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
			NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding
		]
		content?.attributedText = try! NSAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil)
	}

}
