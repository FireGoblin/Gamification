//
//  GoalSet.m
//  Gamification
//
//  Created by Michael Overstreet on 8/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GoalSet.h"

@interface GoalSet()

@property (nonatomic, readonly) int expGain;
@property (nonatomic, readonly) double epicChance;
@property (nonatomic, readonly) double rareChance;
@property (nonatomic, readonly) double uncommonChance;
@property (nonatomic, readonly) double commonChance;

@end

@implementation GoalSet

@synthesize goalType = _goalType, goals = _goal, theUser = _theUser;
@synthesize expGain = _expGain, epicChance = _epicChance, rareChance = _rareChance, uncommonChance = _uncommonChance, commonChance = _commonChance;

//TODO: Add error checking

- (void)addGoal:(NSString *)theGoal
{
    [[self goals] addObject:theGoal];
}

- (void)deleteGoal:(NSString *)theGoal
{
    [[self goals] removeObject:theGoal];
}

- (NSString *)rollForReward
{
    long long ARC4RANDOM_MAX = 0x100000000;     
    double epicRoll = floorf((double)arc4random() / ARC4RANDOM_MAX);
    if(epicRoll <= [self epicChance] * (1 + [[[self theUser] level] intValue] * 0.03 + [[[self theUser] stack] intValue] * 0.15)) return @"Epic";
    double rareRoll = floorf((double)arc4random() / ARC4RANDOM_MAX);
    if(rareRoll <= [self rareChance] * (1 + [[[self theUser] level] intValue] * 0.03 + [[[self theUser] stack] intValue] * 0.15)) return @"Rare";
    double uncommonRoll = floorf((double)arc4random() /ARC4RANDOM_MAX);
    if(uncommonRoll <= [self uncommonChance] * (1 + [[[self theUser] level] intValue] * 0.03 + [[[self theUser] stack] intValue] * 0.15)) return @"Uncommon";
    double commonRoll = floorf((double)arc4random() / ARC4RANDOM_MAX);
    if(commonRoll <= [self commonChance] * (1 + [[[self theUser] level] intValue] * 0.03 + [[[self theUser] stack] intValue] * 0.15)) return @"Common";
    
    return nil;
}


@end
