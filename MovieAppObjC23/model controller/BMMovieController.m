//
//  BMMovieController.m
//  MovieAppObjC23
//
//  Created by Karissa McDaris on 12/21/18.
//  Copyright © 2018 Karissa McDaris. All rights reserved.
//

#import "BMMovieController.h"

@implementation BMMovieController

+ (NSURL *) baseUrl
{
    return [NSURL URLWithString: @"https://api.themoviedb.org/3"];
}

+ (void)fetchAllMoviesWithTitle:(NSString *)title withCompletion:(void (^)(NSArray<BMMovie *> * _Nullable))completion
{
    //MARK: - URL
    //NSURLComponents *searchComponent = [NSURLComponents componentsWithString: @"search"];
    //NSURLComponents *objectComponent = [NSURLComponents componentsWithString: @"movie"];
    
    NSURL *url = [[[BMMovieController baseUrl] URLByAppendingPathComponent:@"search"] URLByAppendingPathComponent:@"movie"];
    
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *keyQuery = [NSURLQueryItem queryItemWithName:@"api_key" value: @"4a8324b23b0f8680560b2a5257ef9f14"];
    NSURLQueryItem *searchQuery = [NSURLQueryItem queryItemWithName:@"query" value:title];
    
    [urlComponents setQueryItems:@[keyQuery, searchQuery]];
    
    NSURL *dataTaskUrl = [urlComponents URL];
    NSLog(@" 📡📡%@📡📡 ", [dataTaskUrl absoluteString]);
    [[[NSURLSession sharedSession] dataTaskWithURL:dataTaskUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"❌ There was an error in %s: %@ ❌", __PRETTY_FUNCTION__ ,error.localizedDescription);
            completion(nil);
            return;
        }
        
        if(!data) {
            completion(nil);
            return;
        }
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSArray *resultsArray = jsonDictionary[@"results"];
        NSMutableArray *moviesArray = [NSMutableArray new];
        
        for (NSDictionary *movieDictionary in resultsArray) {
            BMMovie *movie = [[BMMovie alloc] initWithDictionary:movieDictionary];
            [moviesArray addObject:movie];
        }
        completion(moviesArray);
    }] resume];
    
}

@end
