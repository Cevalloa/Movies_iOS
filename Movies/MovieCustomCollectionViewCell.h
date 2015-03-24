//
//  MovieCustomCollectionViewCell.h
//  Movies
//
//  Created by Alex Cevallos on 3/21/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovieObject;

@interface MovieCustomCollectionViewCell : UICollectionViewCell

-(UICollectionViewCell *)methodCreateImageForCell:(MovieObject *)movieObjectPassedIn;

@end
