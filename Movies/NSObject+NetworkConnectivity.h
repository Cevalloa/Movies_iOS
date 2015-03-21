//
//  NSObject+NetworkConnectivity.h
//  Movies
//
//  Created by Alex Cevallos on 3/20/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (NetworkConnectivity)

#pragma mark - Web Server Data Retrieval Methods
-(void)methodModalLayerSearchMovies:(void(^)(NSArray *dictionaryWithMovie))completion withUserSearchInput:(NSString *)stringToSearch;

#pragma mark - Media Retrieval Methods
-(void)methodModalLayerReturnImage:(void(^)(UIImage *))completion withStringLinkingToImage:(NSString *)stringLinkingToImage;

@end
