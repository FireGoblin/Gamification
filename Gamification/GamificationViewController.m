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

@implementation GamificationViewController

@synthesize theUser = _theUser, theGoals = _theGoals, theRewards = _theRewards;

-(void) initVariables
{
    self.theUser = [[UserStatus alloc] init];
    self.theGoals = [[NSMutableDictionary alloc] initWithCapacity:4];
    [self.theGoals setObject:[[GoalSet alloc] initWithType:@"Common" User:self.theUser] forKey:@"Common"];
    [self.theGoals setObject:[[GoalSet alloc] initWithType:@"Uncommon" User:self.theUser] forKey:@"Uncommon"];
    [self.theGoals setObject:[[GoalSet alloc] initWithType:@"Rare" User:self.theUser] forKey:@"Rare"];
    [self.theGoals setObject:[[GoalSet alloc] initWithType:@"Epic" User:self.theUser] forKey:@"Epic"];
    
    self.theRewards = [[NSMutableDictionary alloc] initWithCapacity:4];
    [self.theRewards setObject:[[RewardSet alloc] init] forKey:@"Common"];
    [self.theRewards setObject:[[RewardSet alloc] init] forKey:@"Uncommon"];
    [self.theRewards setObject:[[RewardSet alloc] init] forKey:@"Rare"];
    [self.theRewards setObject:[[RewardSet alloc] init] forKey:@"Epic"];
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
