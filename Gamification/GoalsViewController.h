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
-(void)deleteGoal:(NSString *)reward ofType:(NSString *)type;
-(NSString *)completeGoal:(NSString *)type;
-(NSString *)rollForReward:(NSString *)type;
@end

@interface GoalsViewController : UIViewController

@property (nonatomic, weak) id <GoalsViewDataSource> dataSource;

-(void)setup:(id <GoalsViewDataSource>)dataSource;

@end
