//
//  UserStatus.m
//  Gamification
//
//  Created by Michael Overstreet on 9/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UserStatus.h"
#import "Constants.h"

int maxCount;
NSTimeInterval expirationTime;
int  expToLevelMap[51];
int maxLevel;

@implementation UserStatus

@synthesize experience = _experience, level = _level, stack = _stack, stackExpiration = _stackExpiration;

- (id)init
{
    self = [super init];
    if(self)
    {
        maxCount = kMaxCount;
        expirationTime = kExpirationTime;
        memcpy(expToLevelMap, kExpToLevelMap, 51 * sizeof(int));
        maxLevel = kMaxLevel;
    }
    return self;
}

- (NSNumber *)experience
{
    if (!_experience) _experience = [NSNumber numberWithInt:0];
    return _experience;
}

- (NSNumber *)level
{
    if(!_level) _level = [NSNumber numberWithInt:0];
    return _level;
}

- (NSNumber *)stack
{
    if(!_stack) _stack = [NSNumber numberWithInt:0];
    return _stack;
}

- (NSDate *)stackExpiration
{
    //initialization is arbitrary
    if(!_stackExpiration) _stackExpiration = [NSDate date];
    return _stackExpiration;
}


//private setter functions---------------------
- (void) setExperience:(NSNumber *)experience
{
    _experience = experience;
}

- (void) setStack:(NSNumber *)stack
{
    _stack = stack;
}

- (void) setStackExpiration:(NSDate *)stackExpiration
{
    _stackExpiration = stackExpiration;
}

//-----------------------------------

- (void) incrementExp:(int)x
{
    [self setExperience:[NSNumber numberWithUnsignedInt:[[self experience] unsignedIntValue] + x]];
}
     
- (void) incrementStack
{
    int val = [self.stack intValue];
    [self setStack: [NSNumber numberWithInt:MIN(maxCount, val + 1)] ];
    [self setStackExpiration: [[NSDate date] dateByAddingTimeInterval:expirationTime]];
}

- (bool) checkTime
{
    if([(NSDate *)[NSDate date] compare:self.stackExpiration] == NSOrderedDescending)
    {
        [self setStack: [NSNumber numberWithInt:0]];
        return true;
    }
    
    return false;
}

@end
