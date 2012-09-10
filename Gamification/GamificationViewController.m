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
        self.theGoals = [[NSMutableDictionary alloc] initWithCapacity:4];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"segueToCurrentStats"])
    {
        [(StatsViewController *) segue.destinationViewController setup:self];
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
