//
//  RewardSet.m
//  Gamification
//
//  Created by Michael Overstreet on 8/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RewardSet.h"
#import "Reward.h"

@implementation RewardSet

@synthesize rewards = _rewards, rewardType = _rewardType, size = _size;

- (void)setRewardType:(NSString *)rewardType
{
    _rewardType = rewardType;
}

- (void)setRewards:(NSMutableDictionary *)rewards
{
    _rewards = rewards;
}

- (void)setSize:(int)size
{
    _size = size;
}

- (id) initWithType:(NSString *)type
{
    self = [super init];
    if(self)
    {
        self.rewardType = type;
        self.rewards = [[NSMutableDictionary alloc] init];
        self.size = 0;
    }
    return self;
}

- (void) useReward:(NSString *)theReward
{
    unsigned int holder = [[[self rewards] valueForKey:theReward] unsignedIntValue];
    [[self rewards] setObject:[NSNumber numberWithUnsignedInt:holder-1] forKey:theReward];
}

- (NSString *) earnRandomReward
{
    NSArray * keys = [[self rewards] allKeys];
    NSString * theReward = [keys objectAtIndex:(arc4random() % [keys count])];
    unsigned int holder = [[[self rewards] valueForKey:theReward] unsignedIntValue];
    [[self rewards] setObject:[NSNumber numberWithUnsignedInt:holder+1] forKey:theReward];
    return theReward;
}

- (void) addReward:(NSString *)theReward
{
    [self.rewards setObject:[[NSNumber alloc] initWithUnsignedInt:0] forKey:[[Reward alloc] initWithTitle:theReward]];
    self.size++;
}

- (void) deleteReward:(NSString *)theReward
{
    [self.rewards removeObjectForKey:[[Reward alloc] initWithTitle:theReward]];
    self.size--;
}

- (NSArray *) getRewards
{
    return [[self rewards] allKeys];
}

@end
