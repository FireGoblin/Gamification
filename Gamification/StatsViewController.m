//
//  StatsViewController.m
//  Gamification
//
//  Created by Michael Overstreet on 9/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StatsViewController.h"

@implementation StatsViewController

@synthesize dataSource = _dataSource;
@synthesize level = _level;
@synthesize progress = _progress;
@synthesize stacks = _stacks;
@synthesize timeLeft = _timeLeft;

- (void) setup:(id <StatsViewDataSource>)dataSource
{
    self.dataSource = dataSource;
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

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(NSString *)timeDescription:(NSString *)original
{
    NSArray * holder = [[NSArray alloc] initWithArray:[original componentsSeparatedByString:@" "]];
    NSMutableString * str = [[NSMutableString alloc] initWithString:@""];
    for (int i = 1; i <= 5; i++) {
        [str appendString:[holder objectAtIndex:i]];
        [str appendString:@" "];
    }
    return str;
}

- (void)viewDidLoad
{
    self.level.text = self.dataSource.theUser.level.stringValue;
    self.stacks.text = self.dataSource.theUser.stack.stringValue;
    if ([self.dataSource.theUser.stack intValue] != 0) {
        self.timeLeft.text = [self timeDescription:[self.dataSource.theUser.stackExpiration descriptionWithLocale:[NSLocale currentLocale]]];
    }
    else
        self.timeLeft.text = @"N/A";
    self.progress.progress = self.dataSource.theUser.getProgress;
    
}

- (void)viewDidUnload
{
    [self setLevel:nil];
    [self setProgress:nil];
    [self setStacks:nil];
    [self setTimeLeft:nil];
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
