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
    
    [self methodModalLayerSearchMovies:^(NSDictionary *dictionaryWithMovie) {
        NSLog(@"%@", [dictionaryWithMovie[@"movies"] objectAtIndex:0]);
    } withUserSearchInput:@"Toy Story"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
