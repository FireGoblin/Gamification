//
//  AddGoalsViewController.m
//  Gamification
//
//  Created by Michael Overstreet on 9/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddGoalsViewController.h"

@implementation AddGoalsViewController
@synthesize goalTitle;
@synthesize viewTitle;
@synthesize dataSource = _dataSource, type = _type;

-(void)setup:(id<GoalsViewDataSource>)dataSource withType:(NSString *)type
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
    [self.dataSource addGoal:goalTitle.text toType:self.type];
    self.goalTitle.text = @"";
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
    viewTitle.title = [[@"Add " stringByAppendingString:self.type] stringByAppendingString:@" Goals"];
    goalTitle.delegate = self;
}


- (void)viewDidUnload
{
    [self setGoalTitle:nil];
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
