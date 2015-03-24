//
//  MovieCustomCollectionViewCell.m
//  Movies
//
//  Created by Alex Cevallos on 3/21/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import "MovieCustomCollectionViewCell.h"
#import "NSObject+NetworkConnectivity.h"
#import "MovieObject.h"

@interface MovieCustomCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewMoviePoster;

@end


@implementation MovieCustomCollectionViewCell

-(UICollectionViewCell *)methodCreateImageForCell:(MovieObject *)movieObjectPassedIn {

    [self methodModalLayerReturnImage:^(UIImage * imageReturned) {
        self.imageViewMoviePoster.image = imageReturned;
    } withStringLinkingToImage:movieObjectPassedIn.dictionaryOfMoviePosterLinks[@"original"]];
    
    return self;
}

@end
