//
//  BMMovieController.h
//  MovieAppObjC23
//
//  Created by Karissa McDaris on 12/21/18.
//  Copyright © 2018 Karissa McDaris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface BMMovieController : NSObject

//MARK: - Fetch posts.
+(void) fetchAllMoviesWithTitle: (NSString *)title
                 withCompletion:(void (^)(NSArray<BMMovie *> * _Nullable movies)) completion;

//MARK: - Fetch images.

@end

NS_ASSUME_NONNULL_END
