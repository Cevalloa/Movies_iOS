//
//  ViewController.m
//  Movies
//
//  Created by Alex Cevallos on 3/20/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import "NSObject+NetworkConnectivity.h"
#import "MovieCustomCollectionViewCell.h"
#import "DetailViewController.h"
#import "MainMoviesViewController.h"

@interface MainMoviesViewController () {
    NSArray *arrayOfMoviesInUseByEntireClass;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewForMovies;

@end

@implementation MainMoviesViewController

#pragma mark - View Controller Lifecycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Creates weak self for blocks
    __weak MainMoviesViewController *weakVersionOfThisClass = self;
    
    //Grabs the movies from the modal layer
    [self methodModalLayerSearchMovies:^(NSArray *arrayReturnedMovies) {

        NSLog(@"Returned array: %@", arrayReturnedMovies);
        
        //Sets the movies to be used by the current class
        arrayOfMoviesInUseByEntireClass = arrayReturnedMovies;
        
        [weakVersionOfThisClass.collectionViewForMovies reloadData];
    } withUserSearchInput:@"Toy Story"];
    
}

#pragma mark - Collection View DataSource Methods
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //Identifier is set in storyboard
    static NSString *cellIdentifier = @"Cell";
    
    MovieCustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return [cell methodCreateImageForCell:arrayOfMoviesInUseByEntireClass[indexPath.row]];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [arrayOfMoviesInUseByEntireClass count];
}

#pragma mark - Collection View Delegate Methods
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"pushToDetail" sender:arrayOfMoviesInUseByEntireClass[indexPath.row]];
}

#pragma mark - Flow Layout Delegate Methods
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //width - x  ... x = spaceInBetweenCells * how many spaces / (how many cells across)
    return CGSizeMake(([UIScreen mainScreen].bounds.size.width - 10) /3 ,170);
    
}

#pragma mark - Storyboard Methods
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [segue.destinationViewController setDictionaryWithDataPassedIn:sender];
}



@end
