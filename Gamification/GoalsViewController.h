//
//  GoalsViewController.h
//  Gamification
//
//  Created by Michael Overstreet on 9/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GoalsViewDataSource <NSObject>
-(NSDictionary *)goalCounts;
@end

@interface GoalsViewController : UIViewController

@property (nonatomic, weak) id <GoalsViewDataSource> dataSource;

-(void)setup:(id <GoalsViewDataSource>)dataSource;

@end
