//
//  BMMovie.h
//  MovieAppObjC23
//
//  Created by Karissa McDaris on 12/21/18.
//  Copyright © 2018 Karissa McDaris. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BMMovie : NSObject

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *summary;
@property (nonatomic, readonly) NSNumber *rating;
@property (nonatomic, readonly, nullable) NSString *imageURLAsString;

-(instancetype)initWithDictionary: (NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END
