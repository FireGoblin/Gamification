//
//  RewardsViewController.h
//  Gamification
//
//  Created by Michael Overstreet on 9/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RewardsViewDataSource <NSObject>
-(NSDictionary *)rewardCounts;
-(void)addReward:(NSString *)reward toType:(NSString *)type;
-(int)rewardCount:(NSString *)type;
-(NSDictionary *)availableRewardCounts;
-(NSString *)getRewardTitleOfType:(NSString *)type atIndex:(NSUInteger)index;
-(void)deleteReward:(NSString *)reward ofType:(NSString *)type;
-(NSDictionary *) availableRewards:(NSString *)type;
-(void)useReward:(NSString *)reward ofType:(NSString *)type;
@end

@interface RewardsViewController : UIViewController

@property (nonatomic, weak) id <RewardsViewDataSource> dataSource;

-(void)setup:(id <RewardsViewDataSource>)dataSource;

@end
