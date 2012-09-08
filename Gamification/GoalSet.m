//
//  GoalSet.m
//  Gamification
//
//  Created by Michael Overstreet on 8/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GoalSet.h"

static int const expGain;
static int const epicChance;
static int const rareChance;
static int const uncommonChance;
static int const commonChance;


@implementation GoalSet

@synthesize goalType = _goalType, goals = _goal, theUser = _theUser;

//TODO: Add error checking

- (void)addGoal:(NSString *)theGoal
{
    [[self goals] addObject:theGoal];
}

- (void)deleteGoal:(NSString *)theGoal
{
    [[self goals] removeObject:theGoal];
}

- (void)gainExp
{
    [[self theUser] incrementExp:expGain];
}

- (NSString *)rollForReward
{
    long long ARC4RANDOM_MAX = 0x100000000;     
    double epicRoll = floorf((double)arc4random() / ARC4RANDOM_MAX);
    if(epicRoll <= epicChance * (1 + [[[self theUser] level] intValue] * 0.03 + [[[self theUser] stack] intValue] * 0.15)) return @"Epic";
    double rareRoll = floorf((double)arc4random() / ARC4RANDOM_MAX);
    if(rareRoll <= rareChance * (1 + [[[self theUser] level] intValue] * 0.03 + [[[self theUser] stack] intValue] * 0.15)) return @"Rare";
    double uncommonRoll = floorf((double)arc4random() /ARC4RANDOM_MAX);
    if(uncommonRoll <= uncommonChance * (1 + [[[self theUser] level] intValue] * 0.03 + [[[self theUser] stack] intValue] * 0.15)) return @"Uncommon";
    double commonRoll = floorf((double)arc4random() / ARC4RANDOM_MAX);
    if(commonRoll <= commonChance * (1 + [[[self theUser] level] intValue] * 0.03 + [[[self theUser] stack] intValue] * 0.15)) return @"Common";
    
    return nil;
}


@end
