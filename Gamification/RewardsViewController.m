//
//  RewardsViewController.m
//  Gamification
//
//  Created by Michael Overstreet on 9/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RewardsViewController.h"
#import "SpecificRewardsViewController.h"

@implementation RewardsViewController

@synthesize dataSource = _dataSource;

-(void)setup:(id<RewardsViewDataSource>)dataSource
{
    self.dataSource = dataSource;
}

- (IBAction)buttonPressed:(id)sender {
    [self performSegueWithIdentifier:@"segueToSpecificRewards" sender:sender];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([((UIButton *) sender).titleLabel.text isEqualToString: @"Add Reward"])
        [(SpecificRewardsViewController *) segue.destinationViewController setup:self.dataSource withInstruction:@"Add"];
    else if([((UIButton *) sender).titleLabel.text isEqualToString: @"Use Reward"])
        [(SpecificRewardsViewController *) segue.destinationViewController setup:self.dataSource withInstruction:@"Use"];
    else if([((UIButton *) sender).titleLabel.text isEqualToString: @"Delete Reward"])
        [(SpecificRewardsViewController *) segue.destinationViewController setup:self.dataSource withInstruction:@"Delete"];
    else
        ; //TODO: handle error
    
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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
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
