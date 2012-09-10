//
//  CompleteGoalsViewController.h
//  Gamification
//
//  Created by Michael Overstreet on 9/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompleteGoalsViewController : UIViewController

@property (nonatomic, strong) NSMutableDictionary *goals;

- (void)setup:(NSMutableDictionary *)goals;

@end
