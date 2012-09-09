//
//  GoalSet.m
//  Gamification
//
//  Created by Michael Overstreet on 8/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GoalSet.h"
#import "Constants.h"

int const expGain;
int const epicChance;
int const rareChance;
int const uncommonChance;
int const commonChance;


@implementation GoalSet

@synthesize goalType = _goalType, goals = _goal, theUser = _theUser;

//private setter
- (void)setGoalType:(NSString *)goalType
{
    _goalType = goalType;
}

//TODO: Add error checking

- (void)initGoal:(NSString *)type
{
    self.goalType = type;
    
}

- (void)addGoal:(NSString *)theGoal
{
    [self.goals addObject:theGoal];
}

- (void)deleteGoal:(NSString *)theGoal
{
    [self.goals removeObject:theGoal];
}

//private
- (void)gainExp
{
    [self.theUser incrementExp:expGain];
}

//private
- (int)rollForReward
{
    long long ARC4RANDOM_MAX = 0x100000000;     
    double epicRoll = floorf((double)arc4random() / ARC4RANDOM_MAX);
    if(epicRoll <= epicChance * (1 + [self.theUser.level intValue] * kLevelValue + [[[self theUser] stack] intValue] * kStackValue)) return Epic;
    double rareRoll = floorf((double)arc4random() / ARC4RANDOM_MAX);
    if(rareRoll <= rareChance * (1 + [self.theUser.level intValue] * kLevelValue + [[[self theUser] stack] intValue] * kStackValue)) return Rare;
    double uncommonRoll = floorf((double)arc4random() /ARC4RANDOM_MAX);
    if(uncommonRoll <= uncommonChance * (1 + [self.theUser.level intValue] * kLevelValue + [[[self theUser] stack] intValue] * kStackValue)) return Uncommon;
    double commonRoll = floorf((double)arc4random() / ARC4RANDOM_MAX);
    if(commonRoll <= commonChance * (1 + [self.theUser.level intValue] * kLevelValue + [[[self theUser] stack] intValue] * kStackValue)) return Common;
    
    return nil;
}

- (int)performGoal
{
    [self gainExp];
    return [self rollForReward];
}


@end
