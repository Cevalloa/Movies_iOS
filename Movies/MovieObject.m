//
//  MovieObject.m
//  Movies
//
//  Created by Alex Cevallos on 3/20/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import "MovieObject.h"
#import "NSValueTransformer+MTLPredefinedTransformerAdditions.h"


@implementation MovieObject

#pragma mark - Mantle Methods
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    
    return @{@"stringTitleOfMovie" : @"title",
             @"dictionaryOfReleaseDates" : @"release_dates",
             @"dictionaryOfRatings" : @"ratings",
             @"arrayOfCastInformation" : @"abridged_cast",
             @"dictionaryOfMoviePosterLinks" : @"posters"};
    
}

@end
