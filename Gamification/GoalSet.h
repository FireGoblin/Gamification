//
//  GoalSet.h
//  Gamification
//
//  Created by Michael Overstreet on 8/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserStatus.h"

@interface GoalSet : NSObject

@property (nonatomic, strong, readonly) NSString *goalType;
@property (nonatomic, strong, readonly) NSMutableArray *goals;
@property (nonatomic, strong, readonly) UserStatus *theUser;
@property (nonatomic, readonly) int size;

- (void) addGoal:(NSString *)theGoal;
- (void) deleteGoal:(NSString *)theGoal;
- (NSString *) performGoal;
- (id) initWithType:(NSString *) type User:(UserStatus *) user;

@end
