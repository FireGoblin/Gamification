//
//  SpecificGoalsViewController.m
//  Gamification
//
//  Created by Michael Overstreet on 9/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SpecificGoalsViewController.h"
#import "AddGoalsViewController.h"

@implementation SpecificGoalsViewController
@synthesize everydayLabel;
@synthesize tinyLabel;
@synthesize smallLabel;
@synthesize mediumLabel;
@synthesize largeLabel;
@synthesize epicLabel;
@synthesize viewTitle;
@synthesize dataSource = _dataSource;
@synthesize instruction = _instruction;

-(void) setup:(id <GoalsViewDataSource>)dataSource withInstruction:(NSString *)instruction
{
    self.dataSource = dataSource;
    self.instruction = instruction;
}

- (IBAction)buttonPressed:(id)sender {
    NSString *titleHolder = [[@"segueTo" stringByAppendingString:self.instruction] stringByAppendingString:@"Goals"];
    [self performSegueWithIdentifier:titleHolder sender:sender];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"segueToAddGoals"]) {
        [(AddGoalsViewController *) segue.destinationViewController setup:self.dataSource withType:((UIButton *) sender).titleLabel.text];
    }
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

-(void)viewWillAppear:(BOOL)animated   
{
    [super viewWillAppear:animated];
    NSDictionary *holder = [[NSDictionary alloc ] initWithDictionary:[self.dataSource goalCounts]];
    everydayLabel.text = [[holder objectForKey:@"Everyday"] stringValue];
    tinyLabel.text = [[holder objectForKey:@"Tiny"] stringValue];
    smallLabel.text = [[holder objectForKey:@"Small"] stringValue];
    mediumLabel.text = [[holder objectForKey:@"Medium"] stringValue];
    largeLabel.text = [[holder objectForKey:@"Large"] stringValue];
    epicLabel.text = [[holder objectForKey:@"Epic"] stringValue];
    viewTitle.title = [self.instruction stringByAppendingString:@" Goals"];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [self setEverydayLabel:nil];
    [self setTinyLabel:nil];
    [self setSmallLabel:nil];
    [self setMediumLabel:nil];
    [self setLargeLabel:nil];
    [self setEpicLabel:nil];
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
