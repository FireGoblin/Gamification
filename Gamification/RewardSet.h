//
//  RewardSet.h
//  Gamification
//
//  Created by Michael Overstreet on 8/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RewardSet : NSObject

@property (nonatomic, strong, readonly) NSString *rewardType;
@property (nonatomic, strong, readonly) NSMutableDictionary *rewards;
@property (nonatomic, readonly) int size;

- (void) useReward:(NSString *)theReward;
- (NSString *) earnRandomReward;

- (void) addReward:(NSString *)theReward;
- (void) deleteReward:(NSString *)theReward;
- (id) initWithType:(NSString *)type;

@end
