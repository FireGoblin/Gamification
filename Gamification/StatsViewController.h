//
//  StatsViewController.h
//  Gamification
//
//  Created by Michael Overstreet on 9/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserStatus.h"

@protocol StatsViewDataSource <NSObject>
@property (nonatomic, strong) UserStatus *theUser;
@end

@interface StatsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *level;
@property (strong, nonatomic) IBOutlet UIProgressView *progress;
@property (strong, nonatomic) IBOutlet UILabel *stacks;
@property (strong, nonatomic) IBOutlet UILabel *timeLeft;

@property (strong, nonatomic) id <StatsViewDataSource> dataSource;

-(void)setup:(id <StatsViewDataSource>)dataSource;

@end
