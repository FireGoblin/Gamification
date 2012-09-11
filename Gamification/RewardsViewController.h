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
@end

@interface RewardsViewController : UIViewController

@property (nonatomic, weak) id <RewardsViewDataSource> dataSource;

-(void)setup:(id <RewardsViewDataSource>)dataSource;

@end
