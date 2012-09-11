//
//  DeleteRewardsViewController.h
//  Gamification
//
//  Created by Michael Overstreet on 9/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RewardsViewController.h"

@interface DeleteRewardsViewController : UITableViewController <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UINavigationItem *viewTitle;

@property (nonatomic, strong) id<RewardsViewDataSource> dataSource;
@property (nonatomic, strong) NSString * type;

-(void)setup:(id <RewardsViewDataSource>)dataSource withType:(NSString *)type;

@end
