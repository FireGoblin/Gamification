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

@synthesize rewards = _rewards, rewardType = _rewardType, size = _size, useSize = _useSize, keys = _keys;

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

- (void)setKeys:(NSMutableSet *)keys
{
    _keys = keys;
}

- (void) writeToFile
{
    NSURL *path = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    path = [path URLByAppendingPathComponent:[@"RewardSet" stringByAppendingString:self.rewardType]];
    NSArray *temp = [[NSArray alloc] initWithObjects:self.rewards, [[NSNumber alloc] initWithInt:self.size], [[NSNumber alloc] initWithInt:self.useSize], nil];
    //write temp to file
    //TODO: write keys
    [temp writeToURL:path atomically:YES];
}

- (void) readFromFile
{
    NSArray *temp = [[NSArray alloc] init];
    NSURL *path = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    path = [path URLByAppendingPathComponent:[@"RewardSet" stringByAppendingString:self.rewardType]];
    temp = [NSArray arrayWithContentsOfURL:path];
    if([temp count] == 3)
    {
        self.rewards = [temp objectAtIndex:0];
        self.size = [[temp objectAtIndex:1] intValue];
        self.useSize = [[temp objectAtIndex:2] intValue];
    //TODO: read keys
    }
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
        self.keys = [[NSMutableSet alloc] init];
        [self readFromFile];
    }
    return self;
}

- (void) useReward:(NSString *)theReward
{
    unsigned int holder = [[self.rewards valueForKey:theReward] unsignedIntValue];
    [self.rewards removeObjectForKey:theReward];
    [self.rewards setValue:[[NSNumber alloc] initWithUnsignedInt:holder-1] forKey:theReward];
    self.useSize--;
    [self writeToFile];
}

- (NSString *) earnRandomReward
{
    NSArray * keys = [self.rewards allKeys];
    if([keys count] == 0) return @"";  //TODO: handle no reward case better
    NSString * theReward = [keys objectAtIndex:(arc4random() % [keys count])];
    unsigned int holder = [[self.rewards valueForKey:theReward] unsignedIntValue];
    [self.rewards removeObjectForKey:theReward];
    [self.rewards setValue:[[NSNumber alloc] initWithUnsignedInt:holder+1] forKey:theReward];
    self.useSize++;
    [self writeToFile];
    return theReward;
}

- (void) addReward:(NSString *)theReward
{
    [self.rewards setValue:[[NSNumber alloc] initWithInt:0] forKey:theReward];
    [self.keys addObject:[[Reward alloc] initWithTitle:theReward]];
    self.size++;
    [self writeToFile];
}

- (void) deleteReward:(NSString *)theReward
{
    self.useSize -= [[self.rewards valueForKey:theReward] intValue];
    [self.rewards removeObjectForKey:theReward];
    [self.keys removeObject:[[Reward alloc] initWithTitle:theReward]];
    self.size--;
    [self writeToFile];
}

- (NSArray *) getRewards
{
    return [[self rewards] allKeys];
}

- (NSDictionary *) availableRewards
{
    NSMutableDictionary *retval = [[NSMutableDictionary alloc] initWithDictionary:self.rewards];
    NSEnumerator *enumerator = [[retval allKeys] objectEnumerator];
    NSString * key;
    
    while(key = [enumerator nextObject]){
        if([[retval objectForKey:key] intValue] == 0) [retval removeObjectForKey:key];
    }
    
    return retval;
}

@end
