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

@synthesize rewards = _rewards, rewardType = _rewardType, size = _size, useSize = _useSize;

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
- (void)setUseSize:(int)useSize
{
    _useSize = useSize;
}

- (id) initWithType:(NSString *)type
{
    self = [super init];
    if(self)
    {
        self.rewardType = type;
        self.rewards = [[NSMutableDictionary alloc] init];
        self.size = 0;
        self.useSize = 0;
    }
    return self;
}

- (void) useReward:(NSString *)theReward
{
    Reward *reward = [[Reward alloc] initWithTitle:theReward];
    unsigned int holder = [[self.rewards objectForKey:reward] unsignedIntValue];
    [self.rewards removeObjectForKey:reward];
    [self.rewards setObject:[[NSNumber alloc] initWithUnsignedInt:holder-1] forKey:reward];
    self.useSize--;
}

- (NSString *) earnRandomReward
{
    NSArray * keys = [[self rewards] allKeys];
    Reward * theReward = [keys objectAtIndex:(arc4random() % [keys count])];
    unsigned int holder = [[[self rewards] objectForKey:theReward] unsignedIntValue];
    [self.rewards removeObjectForKey:theReward];
    [self.rewards setObject:[[NSNumber alloc] initWithUnsignedInt:holder+1] forKey:theReward];
    self.useSize++;
    return theReward.title;
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

- (NSDictionary *) availableRewards
{
    NSMutableDictionary *retval = [[NSMutableDictionary alloc] initWithDictionary:self.rewards];
    NSEnumerator *enumerator = [[retval allKeys] objectEnumerator];
    Reward * key;
    
    while(key = [enumerator nextObject]){
        if([[retval objectForKey:key] intValue] == 0) [retval removeObjectForKey:key];
    }
    
    return retval;
}

@end
