//
//  BMMovie.m
//  MovieAppObjC23
//
//  Created by Karissa McDaris on 12/21/18.
//  Copyright © 2018 Karissa McDaris. All rights reserved.
//

#import "BMMovie.h"

@implementation BMMovie

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *summary = dictionary[@"overview"];
    NSNumber *rating = dictionary[@"vote_average"];
    NSString *imageURLAsString = dictionary[@"poster_path"];
    
    if(![title isKindOfClass:[NSString class]] || ![rating isKindOfClass: [NSNumber class]] || ![summary isKindOfClass: [NSString class]]) {
        return nil;
    }
    
    self = [super init];
    if (self) {
        _title = title;
        _summary = summary;
        _rating = rating;
        _imageURLAsString = imageURLAsString;
    }
    return self;
}

@end
