//
//  AddGoalsViewController.h
//  Gamification
//
//  Created by Michael Overstreet on 9/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoalsViewController.h"

@interface AddGoalsViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *goalTitle;
@property (weak, nonatomic) IBOutlet UINavigationItem *viewTitle;

@property (nonatomic, strong) id <GoalsViewDataSource> dataSource;
@property (nonatomic, strong) NSString *type;

-(void)setup:(id <GoalsViewDataSource>)dataSource withType:(NSString *)type;

@end
