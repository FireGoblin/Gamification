//
//  SpecificGoalsViewController.h
//  Gamification
//
//  Created by Michael Overstreet on 9/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoalsViewController.h"

@interface SpecificGoalsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *everydayLabel;
@property (weak, nonatomic) IBOutlet UILabel *tinyLabel;
@property (weak, nonatomic) IBOutlet UILabel *smallLabel;
@property (weak, nonatomic) IBOutlet UILabel *mediumLabel;
@property (weak, nonatomic) IBOutlet UILabel *largeLabel;
@property (weak, nonatomic) IBOutlet UILabel *epicLabel;
@property (weak, nonatomic) IBOutlet UINavigationItem *viewTitle;

@property (nonatomic, strong) id <GoalsViewDataSource> dataSource;
@property (nonatomic, strong) NSString *instruction;

-(void) setup:(id <GoalsViewDataSource>)dataSource withInstruction:(NSString *)instruction;


@end
