//
//  MovieObject.h
//  Movies
//
//  Created by Alex Cevallos on 3/20/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@interface MovieObject : MTLModel <MTLJSONSerializing>

@property (nonatomic) NSString *stringTitleOfMovie;
@property (nonatomic) NSDictionary *dictionaryOfReleaseDates;
@property (nonatomic) NSDictionary *dictionaryOfRatings;
@property (nonatomic) NSDictionary *arrayOfCastInformation;
@property (nonatomic) NSDictionary *dictionaryOfMoviePosterLinks;

@end
