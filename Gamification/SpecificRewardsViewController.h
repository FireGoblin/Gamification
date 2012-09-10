//
//  SpecificRewardsViewController.h
//  Gamification
//
//  Created by Michael Overstreet on 9/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RewardsViewController.h"

@interface SpecificRewardsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *commonLabel;
@property (weak, nonatomic) IBOutlet UILabel *uncommonLabel;
@property (weak, nonatomic) IBOutlet UILabel *rareLabel;
@property (weak, nonatomic) IBOutlet UILabel *legendaryLabel;
@property (weak, nonatomic) IBOutlet UINavigationItem *viewTitle;

@property (nonatomic, strong) id <RewardsViewDataSource> dataSource;
@property (nonatomic, strong) NSString *instruction;

-(void) setup:(id <RewardsViewDataSource>)dataSource withInstruction:(NSString *)instruction;

@end
