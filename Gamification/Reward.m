//
//  Reward.m
//  Gamification
//
//  Created by Michael Overstreet on 9/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Reward.h"

@implementation Reward

@synthesize title = _title;

- (id) initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        self.title = title;
    }
    return self;
}

- (id) initWithPlist:(id)plist
{
    self = [super init];
    if (self) {
        self.title = plist;
    }
    return self;
}

- (BOOL) isEqual:(id)anObject
{
    if([anObject class] != [Reward class])
        return FALSE;
    else if([((Reward *) anObject).title isEqualToString: self.title])
        return TRUE;
    else
        return FALSE;
    
    //backup, should not hit
    return FALSE;
}

//Implemented for NSCopying protocol
- (id)copyWithZone:(NSZone *)zone
{
    Reward *copy = [[[self class] allocWithZone:zone] initWithTitle:self.title];
    return copy;
}

- (id)plist
{
    NSString *retval = self.title;
    return retval;
}

@end
