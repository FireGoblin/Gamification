//
//  GoalSet.m
//  Gamification
//
//  Created by Michael Overstreet on 8/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GoalSet.h"
#import "Constants.h"
#import "Goal.h"

@implementation GoalSet

goalsize chanceIndex;
int expGain;
int legendaryChance;
int rareChance;
int uncommonChance;
int commonChance;

@synthesize goalType = _goalType, goals = _goals, theUser = _theUser;


//private setters -----------------
-(void) setGoalType:(NSString *)goalType
{
    _goalType = goalType;
}

- (void)setTheUser:(UserStatus *)theUser
{
    _theUser = theUser;
}

- (void)setGoals:(NSMutableArray *)goals
{
    _goals = goals;
}
//----------------------------

//must be called for proper initialization
- (id) initWithType:(NSString *) type User:(UserStatus *) user
{
    self = [super init];
    if(self){
        self.goalType = type;
        self.theUser = user;
        self.goals = [[NSMutableArray alloc] init ];
    
        if(type == @"Everyday")
            chanceIndex = Everyday;
        else if(type == @"Tiny")
            chanceIndex = Tiny;
        else if(type == @"Small")
            chanceIndex = Small;
        else if(type == @"Medium")
            chanceIndex = Medium;
        else if(type == @"Large")
            chanceIndex = Large;
        else if(type == @"Epic")
            chanceIndex = Epic;
        else
            ;//TODO: handle error
        
        expGain = kExpGain[chanceIndex];
        commonChance = kCommonChance[chanceIndex];
        uncommonChance = kUncommonChance[chanceIndex];
        rareChance = kRareChance[chanceIndex];
        legendaryChance = kEpicChance[chanceIndex];
    }
    return self;
}

//TODO: Add error checking

- (void)initGoal:(NSString *)type
{
    self.goalType = type;
    
}

- (void)addGoal:(NSString *)theGoal
{
    [self.goals addObject:[[Goal alloc] initWithTitle:theGoal]];
}

- (void)deleteGoal:(NSString *)theGoal
{
    [self.goals removeObject:[[Goal alloc] initWithTitle:theGoal]];
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
    if(epicRoll <= legendaryChance * (1 + [self.theUser.level intValue] * kLevelValue + [[[self theUser] stack] intValue] * kStackValue)) return Legendary;
    double rareRoll = floorf((double)arc4random() / ARC4RANDOM_MAX);
    if(rareRoll <= rareChance * (1 + [self.theUser.level intValue] * kLevelValue + [[[self theUser] stack] intValue] * kStackValue)) return Rare;
    double uncommonRoll = floorf((double)arc4random() /ARC4RANDOM_MAX);
    if(uncommonRoll <= uncommonChance * (1 + [self.theUser.level intValue] * kLevelValue + [[[self theUser] stack] intValue] * kStackValue)) return Uncommon;
    double commonRoll = floorf((double)arc4random() / ARC4RANDOM_MAX);
    if(commonRoll <= commonChance * (1 + [self.theUser.level intValue] * kLevelValue + [[[self theUser] stack] intValue] * kStackValue)) return Common;
    
    return -1;
}

- (int)performGoal
{
    [self gainExp];
    return [self rollForReward];
}


@end
