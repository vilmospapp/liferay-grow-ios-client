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

#import <Foundation/Foundation.h>
#import "LRWikicontentService_v7.h"

/**
 * @author Bruno Farache
 */
@implementation LRWikicontentService_v7

- (NSString *)getRenderedWikiPageWithSiteUrl:(NSString *)siteUrl plid:(long long)plid groupId:(long long)groupId nodeId:(long long)nodeId name:(NSString *)name error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
		@"siteUrl": [self checkNull: siteUrl],
		@"plid": @(plid),
		@"groupId": @(groupId),
		@"nodeId": @(nodeId),
		@"name": [self checkNull: name]
	}];

	NSDictionary *_command = @{@"/wikiextractor.wikicontent/get-rendered-wiki-page": _params};

	return (NSString *)[self.session invoke:_command error:error];
}

@end