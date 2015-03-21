//
//  ViewController.m
//  Movies
//
//  Created by Alex Cevallos on 3/20/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import "NSObject+NetworkConnectivity.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - View Controller Lifecycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self methodModalLayerSearchMovies:^(NSArray *arrayWithMovies) {
        NSLog(@"Count: %lu", [arrayWithMovies count]);
        NSLog(@"Returned array: %@", arrayWithMovies);
    } withUserSearchInput:@"Toy Story"];
    
}

#pragma mark - Collection View DataSource Methods
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //Identifier is set in storyboard
    static NSString *cellIdentifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}



@end
