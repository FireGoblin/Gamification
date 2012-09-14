//
//  GamificationViewController.m
//  Gamification
//
//  Created by Michael Overstreet on 8/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GamificationViewController.h"
#import "GoalSet.h"
#import "RewardSet.h"
#import "StatsViewController.h"
#import "Goal.h"
#import "Reward.h"

@implementation GamificationViewController

@synthesize theUser = _theUser, theGoals = _theGoals, theRewards = _theRewards;

-(void) initVariables
{
    if(!self.theUser)
    {
        self.theUser = [[UserStatus alloc] init];
    }
    if(!self.theGoals)
    {
        self.theGoals = [[NSMutableDictionary alloc] initWithCapacity:6];
        [self.theGoals setObject:[[GoalSet alloc] initWithType:@"Everyday" User:self.theUser] forKey:@"Everyday"];
        [self.theGoals setObject:[[GoalSet alloc] initWithType:@"Tiny" User:self.theUser] forKey:@"Tiny"];
        [self.theGoals setObject:[[GoalSet alloc] initWithType:@"Small" User:self.theUser] forKey:@"Small"];
        [self.theGoals setObject:[[GoalSet alloc] initWithType:@"Medium" User:self.theUser] forKey:@"Medium"];
        [self.theGoals setObject:[[GoalSet alloc] initWithType:@"Large" User:self.theUser] forKey:@"Large"];
        [self.theGoals setObject:[[GoalSet alloc] initWithType:@"Epic" User:self.theUser] forKey:@"Epic"];
    }
    if(!self.theRewards)
    {
        self.theRewards = [[NSMutableDictionary alloc] initWithCapacity:4];
        [self.theRewards setObject:[[RewardSet alloc] initWithType:@"Common"] forKey:@"Common"];
        [self.theRewards setObject:[[RewardSet alloc] initWithType:@"Uncommon"] forKey:@"Uncommon"];
        [self.theRewards setObject:[[RewardSet alloc] initWithType:@"Rare"] forKey:@"Rare"];
        [self.theRewards setObject:[[RewardSet alloc] initWithType:@"Legendary"] forKey:@"Legendary"];
    }
}

-(NSDictionary *)rewardCounts
{
    NSMutableDictionary *retVal = [[NSMutableDictionary alloc] initWithCapacity:4];
    [retVal setObject:[[NSNumber alloc] initWithInt:((RewardSet *)[self.theRewards objectForKey:@"Common"]).size] forKey:@"Common"];
    [retVal setObject:[[NSNumber alloc] initWithInt:((RewardSet *)[self.theRewards objectForKey:@"Uncommon"]).size] forKey:@"Uncommon"];
    [retVal setObject:[[NSNumber alloc] initWithInt:((RewardSet *)[self.theRewards objectForKey:@"Rare"]).size] forKey:@"Rare"];
    [retVal setObject:[[NSNumber alloc] initWithInt:((RewardSet *)[self.theRewards objectForKey:@"Legendary"]).size] forKey:@"Legendary"];
    return retVal;
}

-(NSDictionary *)availableRewardCounts
{
    NSMutableDictionary *retVal = [[NSMutableDictionary alloc] initWithCapacity:4];
    [retVal setObject:[[NSNumber alloc] initWithInt:((RewardSet *)[self.theRewards objectForKey:@"Common"]).useSize] forKey:@"Common"];
    [retVal setObject:[[NSNumber alloc] initWithInt:((RewardSet *)[self.theRewards objectForKey:@"Uncommon"]).useSize] forKey:@"Uncommon"];
    [retVal setObject:[[NSNumber alloc] initWithInt:((RewardSet *)[self.theRewards objectForKey:@"Rare"]).useSize] forKey:@"Rare"];
    [retVal setObject:[[NSNumber alloc] initWithInt:((RewardSet *)[self.theRewards objectForKey:@"Legendary"]).useSize] forKey:@"Legendary"];
    return retVal;
}

-(NSDictionary *)goalCounts
{
    NSMutableDictionary *retVal = [[NSMutableDictionary alloc] initWithCapacity:6];
    [retVal setObject:[[NSNumber alloc] initWithInt:((GoalSet *)[self.theGoals objectForKey:@"Everyday"]).size] forKey:@"Everyday"];
    [retVal setObject:[[NSNumber alloc] initWithInt:((GoalSet *)[self.theGoals objectForKey:@"Tiny"]).size] forKey:@"Tiny"];
    [retVal setObject:[[NSNumber alloc] initWithInt:((GoalSet *)[self.theGoals objectForKey:@"Small"]).size] forKey:@"Small"];
    [retVal setObject:[[NSNumber alloc] initWithInt:((GoalSet *)[self.theGoals objectForKey:@"Medium"]).size] forKey:@"Medium"];
    [retVal setObject:[[NSNumber alloc] initWithInt:((GoalSet *)[self.theGoals objectForKey:@"Large"]).size] forKey:@"Large"];
    [retVal setObject:[[NSNumber alloc] initWithInt:((GoalSet *)[self.theGoals objectForKey:@"Epic"]).size] forKey:@"Epic"];
    return retVal;
}

-(int)goalCount:(NSString *)type
{
    return ((GoalSet *) [self.theGoals objectForKey:type]).size;
}

-(int)rewardCount:(NSString *)type
{
    return ((RewardSet *) [self.theRewards objectForKey:type]).size;
}

-(void)addReward:(NSString *)reward toType:(NSString *)type
{
    [[self.theRewards objectForKey:type] addReward:reward];
}

-(void)addGoal:(NSString *)goal toType:(NSString *)type
{
    [[self.theGoals objectForKey:type] addGoal:goal];
}

-(NSString *)getGoalTitleOfType:(NSString *)type atIndex:(NSUInteger)index
{
    return [((GoalSet *) [self.theGoals objectForKey:type]).goals objectAtIndex:index];
}

-(NSString *)getRewardTitleOfType:(NSString *)type atIndex:(NSUInteger)index
{
    return [[[self.theRewards objectForKey:type] getRewards] objectAtIndex:index];
}

-(void)deleteGoal:(NSString *)reward ofType:(NSString *)type
{
    [[self.theGoals objectForKey:type] deleteGoal:reward];
}

-(void)deleteReward:(NSString *)reward ofType:(NSString *)type
{
    [[self.theRewards objectForKey:type] deleteReward:reward];
}

-(NSDictionary *)availableRewards:(NSString *)type
{
    return [[self.theRewards objectForKey:type] availableRewards];
}

-(NSString *)completeGoal:(NSString *)type
{
    return [[self.theGoals objectForKey:type] performGoal];
}

-(NSString *)rollForReward:(NSString *)type
{
    return [[self.theRewards objectForKey:type] earnRandomReward];
}

-(void)useReward:(NSString *)reward ofType:(NSString *)type
{
    [[self.theRewards objectForKey:type] useReward:reward];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"segueToCurrentStats"])
    {
        [(StatsViewController *) segue.destinationViewController setup:self];
    }
    else if([segue.identifier isEqualToString:@"segueToRewards"])
    {
        [(RewardsViewController *) segue.destinationViewController setup:self];
    }
    else if([segue.identifier isEqualToString:@"segueToGoals"])
    {
        [(GoalsViewController *) segue.destinationViewController setup:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //if(!self.theUser)
        [self initVariables];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
