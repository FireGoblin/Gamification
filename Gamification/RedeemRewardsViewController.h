//
//  RedeemRewardsViewController.h
//  Gamification
//
//  Created by Michael Overstreet on 9/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RedeemRewardsViewController : UIViewController

@property (nonatomic, strong) NSMutableDictionary *rewards;

- (void)setup:(NSMutableDictionary *)rewards;

@end
