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

@synthesize goalType = _goalType, goals = _goals;
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
    if(epicRoll <= [self epicChance]) return [[NSString alloc] initWithCharacters:(const unichar *)"Epic" length:4];
    double rareRoll = floorf((double)arc4random() / ARC4RANDOM_MAX);
    if(rareRoll <= [self rareChance]) return [[NSString alloc] initWithCharacters:(const unichar *)"Rare" length:4];
    double uncommonRoll = floorf((double)arc4random() /ARC4RANDOM_MAX);
    if(uncommonRoll <= [self uncommonChance]) return [[NSString alloc] initWithCharacters:(const unichar *)"Uncommon" length:8];
    double commonRoll = floorf((double)arc4random() / ARC4RANDOM_MAX);
    if(commonRoll <= [self commonChance]) return [[NSString alloc] initWithCharacters:(const unichar *)"Common" length:6];
    
    return nil;
}


@end
