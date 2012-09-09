//
//  GamificationViewController.h
//  Gamification
//
//  Created by Michael Overstreet on 8/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserStatus.h"

@interface GamificationViewController : UIViewController

@property(nonatomic, strong)UserStatus *theUser;
@property(nonatomic, strong)NSMutableDictionary *theGoals;
@property(nonatomic, strong)NSMutableDictionary *theRewards;


@end
