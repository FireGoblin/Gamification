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
-(void)addGoal:(NSString *)goal toType:(NSString *)type;
-(int)goalCount:(NSString *)type;
-(NSString *)getGoalTitleOfType:(NSString *)type atIndex:(NSUInteger)index;
@end

@interface GoalsViewController : UIViewController

@property (nonatomic, weak) id <GoalsViewDataSource> dataSource;

-(void)setup:(id <GoalsViewDataSource>)dataSource;

@end
