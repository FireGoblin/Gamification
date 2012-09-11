//
//  Reward.h
//  Gamification
//
//  Created by Michael Overstreet on 9/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reward : NSObject <NSCopying>

@property (nonatomic, strong)NSString *title;

- (id) initWithTitle:(NSString *)title;
- (BOOL) isEqual:(id)anObject;

@end
