//
//  UseRewardsViewController.h
//  Gamification
//
//  Created by Michael Overstreet on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RewardsViewController.h"

@interface UseRewardsViewController : UITableViewController <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UINavigationItem *viewTitle;

@property (nonatomic, strong) id<RewardsViewDataSource> dataSource;
@property (nonatomic, strong) NSString * type;
@property (nonatomic, strong) NSDictionary * availableRewards;

-(void)setup:(id <RewardsViewDataSource>)dataSource withType:(NSString *)type;

@end
