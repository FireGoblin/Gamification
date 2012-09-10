//
//  GamificationViewController.h
//  Gamification
//
//  Created by Michael Overstreet on 8/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserStatus.h"
#import "GoalsViewController.h"
#import "RewardsViewController.h"
#import "StatsViewController.h"

@interface GamificationViewController : UIViewController <GoalsViewDataSource, RewardsViewDataSource, StatsViewDataSource>

@property(nonatomic, strong)UserStatus *theUser;
@property(nonatomic, strong)NSMutableDictionary *theGoals;
@property(nonatomic, strong)NSMutableDictionary *theRewards;


@end
