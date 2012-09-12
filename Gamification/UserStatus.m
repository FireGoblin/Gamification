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

- (void) setLevel:(NSNumber *)level
{
    _level = level;
}

//-----------------------------------

- (void) readFromFile
{
    NSArray *temp = [[NSArray alloc] init];
    NSURL *path = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    path = [path URLByAppendingPathComponent:@"UserStatus"];
    temp = [NSArray arrayWithContentsOfURL:path];
    //set temp to file contents
    if([temp count] == 4)
    {
        self.experience = [temp objectAtIndex:0];
        self.level = [temp objectAtIndex:1];
        self.stack = [temp objectAtIndex:2];
        self.stackExpiration = [temp objectAtIndex:3];
    }
}

- (void) writeToFile
{
    NSURL *path = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    path = [path URLByAppendingPathComponent:@"UserStatus"];
    NSArray *temp = [[NSArray alloc] initWithObjects:self.experience, self.level, self.stack, self.stackExpiration, nil];
    [temp writeToURL:path atomically:YES];
}

- (id)init
{
    self = [super init];
    if(self)
    {
        maxCount = kMaxCount;
        expirationTime = kExpirationTime;
        memcpy(expToLevelMap, kExpToLevelMap, 51 * sizeof(int));
        maxLevel = kMaxLevel;
        [self readFromFile];
    }
    return self;
}

- (NSNumber *)experience
{
    if (!_experience) _experience = [[NSNumber alloc] initWithInt:0];
    return _experience;
}

- (NSNumber *)level
{
    if(!_level) _level = [[NSNumber alloc] initWithInt:0];
    return _level;
}

- (NSNumber *)stack
{
    if(!_stack) _stack = [[NSNumber alloc] initWithInt:0];
    else [self checkTime];
    return _stack;
}

- (NSDate *)stackExpiration
{
    //initialization is arbitrary
    if(!_stackExpiration)
    {
        _stackExpiration = [[NSDate alloc] init];
        _stackExpiration = [NSDate date];
    }
    return _stackExpiration;
}

- (void) incrementExp:(int)x
{
    [self setExperience:[NSNumber numberWithUnsignedInt:MIN(expToLevelMap[maxLevel], [[self experience] unsignedIntValue] + x)]];
    int currentLevel = [self.level intValue];
    if(currentLevel == maxLevel) return;
    int nextLevel = currentLevel;
    while (nextLevel == currentLevel) {
        nextLevel++;
        if ([self.experience intValue] >= expToLevelMap[nextLevel]) currentLevel = nextLevel;
    }
    self.level = [NSNumber numberWithInt:currentLevel];

    if(x >= 30) [self incrementStack];  //TODO: Formalize the if statement
    [self writeToFile];
}
     
- (void) incrementStack
{
    int val = [self.stack intValue];
    [self setStack: [NSNumber numberWithInt:MIN(maxCount, val + 1)] ];
    [self setStackExpiration: [[NSDate date] dateByAddingTimeInterval:expirationTime]];
}

- (BOOL) checkTime
{
    if([(NSDate *)[NSDate date] compare:self.stackExpiration] == NSOrderedDescending)
    {
        [self setStack: [NSNumber numberWithInt:0]];
        return TRUE;
    }
    
    return FALSE;
}

- (float) getProgress
{
    if([self.level intValue] == maxLevel) return 0.0;
    return (float) ([self.experience intValue] - expToLevelMap[[self.level intValue]]) / (expToLevelMap[[self.level intValue] + 1] - expToLevelMap[[self.level intValue]]);
}

@end
