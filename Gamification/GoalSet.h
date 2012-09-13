//
//  GoalSet.h
//  Gamification
//
//  Created by Michael Overstreet on 8/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserStatus.h"

//An object containing the goals of a particular goalType.
//currently goals are effectively just an NSString.  However it is programmed to allow for additionally functionality/properties in Goal.
@interface GoalSet : NSObject

@property (nonatomic, strong, readonly) NSString *goalType;     //One of 6 strings: @"Everyday", @"Tiny", @"Small", @"Medium", @"Large", @"Epic
@property (nonatomic, strong, readonly) NSMutableArray *goals;  //An array of string representations of the goals
@property (nonatomic, strong, readonly) UserStatus *theUser;    //The user's status
@property (nonatomic, readonly) NSInteger size;                 //current size of goals
@property (nonatomic, strong, readonly) NSMutableSet *keys;     //A set of the goals as actual Goal objects

- (void) addGoal:(NSString *)theGoal;
- (void) deleteGoal:(NSString *)theGoal;
- (NSString *) performGoal;
- (id) initWithType:(NSString *) type User:(UserStatus *) user;

@end
