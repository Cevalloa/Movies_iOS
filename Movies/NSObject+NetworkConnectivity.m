//
//  NSObject+NetworkConnectivity.m
//  Movies
//
//  Created by Alex Cevallos on 3/20/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import "NSObject+NetworkConnectivity.h"
#import "MovieObject.h"

@implementation NSObject (NetworkConnectivity)

#pragma mark Web Server Data Retrieval Methods
-(void)methodModalLayerSearchMovies:(void (^)(NSArray *))completion withUserSearchInput:(NSString *)stringToSearch{
    
    //We want to URL encode the string comming in from the user
    NSString *stringToSearchNowEncodedURL = [stringToSearch stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    
    //The string that will be sent in
    NSString *stringFinalURL= [NSString stringWithFormat:@"http://api.rottentomatoes.com/api/public/v1.0/movies.json?q=%@&apikey=4s2w5jzgqwfpj9v2jdmd9xee", stringToSearchNowEncodedURL];
    
    NSURL *url = [[NSURL alloc] initWithString:stringFinalURL];
    
    //The session is generic, we don't need configuration at the moment
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    //We only need data task for this, not download task
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
       
        if (error){
            //Temporary placeholder for error
            NSLog(@"Something has gone wrong.. %@,", error);
            completion(nil);
        }
        
        
        NSDictionary *dictionaryWithMoviesFoundInSearch = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        NSError *errorForMantle;
        
        //Uses mantle to take the JSON array & transform it into "MovieObject" objects
        NSArray *arrayOfMovies = [MTLJSONAdapter modelsOfClass:[MovieObject class]
                                                 fromJSONArray:dictionaryWithMoviesFoundInSearch[@"movies"]
                                                         error:&errorForMantle];
        
        //Goes back onto the main thread for UI manipulation
        dispatch_async(dispatch_get_main_queue(), ^{

            //Error handling for mantle happens here
            if(errorForMantle){
                NSLog(@"Error from mantle is.. %@",errorForMantle);
                completion(nil);
            }
            
            //Tells block we are complete & hold the data
            completion(arrayOfMovies);
            
        });

        
        
    }];
    
    
    [task resume];

    
    
}

#pragma mark Media Retrieval Methods
-(void)methodModalLayerReturnImage:(void (^)(UIImage *))completion withStringLinkingToImage:(NSString *)stringLinkingToImage{
    
}
@end
