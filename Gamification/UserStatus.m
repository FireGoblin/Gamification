//
//  UserStatus.m
//  Gamification
//
//  Created by Michael Overstreet on 9/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UserStatus.h"

static int const maxCount = 5;
static NSTimeInterval const timeToExpiration = 1296000;

@implementation UserStatus

@synthesize experience = _experience, level = _level, expToLevelMap = _expToLevelMap, stack = _stack, stackExpiration = _stackExpiration;



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

- (void) incrementExp:(int)x
{
    [self setExperience:[NSNumber numberWithUnsignedInt:[[self experience] unsignedIntValue] + x]];
}
     
- (void) incrementStack
{
    int val = [[self stack] intValue];
    [self setStack: [NSNumber numberWithInt:MIN(maxCount, val + 1)] ];
    [self setStackExpiration: [[NSDate date] dateByAddingTimeInterval:timeToExpiration]];
}

- (void) checkTime
{
    if([[NSDate date] compare:[self stackExpiration]] == NSOrderedDescending)
    {
        [self setStack: [NSNumber numberWithInt:0]];
    }
}

@end
