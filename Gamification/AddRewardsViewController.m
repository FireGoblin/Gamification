//
//  AddRewardsViewController.m
//  Gamification
//
//  Created by Michael Overstreet on 9/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddRewardsViewController.h"

@implementation AddRewardsViewController
@synthesize rewardTitle;
@synthesize viewTitle;
@synthesize dataSource = _dataSource, type = _type;

-(void)setup:(id<RewardsViewDataSource>)dataSource withType:(NSString *)type
{
    self.dataSource = dataSource;
    self.type = type;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return TRUE;
}

- (IBAction)buttonPressed:(id)sender {
    NSString *message = [[[rewardTitle.text stringByAppendingString:@" was added to "] stringByAppendingString:self.type] stringByAppendingString:@" Rewards"];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Reward Added"
                          message:message
                          delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];
    
    [self.dataSource addReward:rewardTitle.text toType:self.type];
    rewardTitle.text = @"";
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    viewTitle.title = [[@"Add " stringByAppendingString:self.type] stringByAppendingString:@" Rewards"];
    rewardTitle.delegate = self;
}


- (void)viewDidUnload
{
    [self setRewardTitle:nil];
    [self setViewTitle:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
