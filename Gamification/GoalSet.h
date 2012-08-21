//
//  GoalSet.h
//  Gamification
//
//  Created by Michael Overstreet on 8/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoalSet : NSObject

@property (nonatomic, strong, readonly) NSString *goalType;
@property (nonatomic, strong, readonly) NSMutableArray *goals;

- (void) addGoal:(NSString *)theGoal;
- (void) deleteGoal:(NSString *)theGoal;
- (void) rollForReward;

@end
