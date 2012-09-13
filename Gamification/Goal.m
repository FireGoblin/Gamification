//
//  Goal.m
//  Gamification
//
//  Created by Michael Overstreet on 9/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Goal.h"

@implementation Goal

@synthesize title = _title;

- (id) initWithTitle:(id)title
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
    if([anObject class] != [Goal class])
        return FALSE;
    else if(((Goal *) anObject).title == self.title)
        return TRUE;
    else
        return FALSE;
    
    //backup, should not hit
    return FALSE;
}

- (id)plist
{
    NSString * retval = self.title;
    return retval;
}

@end
