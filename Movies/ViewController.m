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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self methodModalLayerSearchMovies:^(NSArray *arrayWithMovies) {
        NSLog(@"Count: %lu", [arrayWithMovies count]);
        NSLog(@"Returned array: %@", arrayWithMovies);
    } withUserSearchInput:@"Toy Story"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
