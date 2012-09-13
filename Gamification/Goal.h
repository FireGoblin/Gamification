//
//  Goal.h
//  Gamification
//
//  Created by Michael Overstreet on 9/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Goal : NSObject

@property (nonatomic, strong)NSString *title;   //title of the goal

- (id) initWithTitle:(NSString *)title;
- (BOOL) isEqual:(id)anObject;              

- (id)plist;    //returns a property list representation of Goal
- (id) initWithPlist:(NSString *)plist;

@end
