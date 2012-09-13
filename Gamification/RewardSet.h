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
@property (nonatomic, readonly) NSInteger size;
@property (nonatomic, readonly) NSInteger useSize;
@property (nonatomic, strong, readonly) NSMutableSet *keys;

- (void) useReward:(NSString *)theReward;
- (NSString *) earnRandomReward;

- (void) addReward:(NSString *)theReward;
- (void) deleteReward:(NSString *)theReward;
- (id) initWithType:(NSString *)type;
- (NSArray *)getRewards;
- (NSDictionary *)availableRewards;

@end
