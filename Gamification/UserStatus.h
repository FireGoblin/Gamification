//
//  UserStatus.h
//  Gamification
//
//  Created by Michael Overstreet on 9/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserStatus : NSObject

@property (nonatomic, strong, readonly) NSNumber * experience;
@property (nonatomic, strong, readonly) NSNumber * level;
@property (nonatomic, strong, readonly) NSNumber * stack;
@property (nonatomic, strong, readonly) NSDate * stackExpiration;

- (void) incrementExp:(int) x;
- (void) incrementStack;
- (BOOL) checkTime;
- (float) getProgress;

@end
