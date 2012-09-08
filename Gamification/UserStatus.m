//
//  UserStatus.m
//  Gamification
//
//  Created by Michael Overstreet on 9/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UserStatus.h"

@interface UserStatus()

@property (nonatomic, readonly) int maxCount;
@property (nonatomic, readonly) NSTimeInterval timeToExpiration;


@end

@implementation UserStatus

@synthesize maxCount = _maxCount, timeToExpiration = _timeToExpiration;
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
    [self setStack: [NSNumber numberWithInt:MIN([self maxCount], val + 1)] ];
    [self setStackExpiration: [[NSDate date] dateByAddingTimeInterval:[self timeToExpiration]]];
}

- (void) checkTime
{
    if([[NSDate date] compare:[self stackExpiration]] == NSOrderedDescending)
    {
        [self setStack: [NSNumber numberWithInt:0]];
    }
}

@end
