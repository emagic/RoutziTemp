//
//  CustomNavViewController.m
//  
//
//  Created by Tapha Media Ltd on 9/27/11.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "CustomNavViewController.h"


@implementation CustomNavViewController

@synthesize navBarView;



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.navBarView = [CustomNavigationBarView viewFromStoryboard];
	[self.navBarView setFrame:CGRectMake( 0, 0, 320, 44 )];
}



// Override to allow orientations other than the default portrait orientation.
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (( interfaceOrientation == UIInterfaceOrientationPortrait ) || 
            ( interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown ));
}
 */



- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}



- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



#pragma mark Set navigationBar
- (void) insertNavBarWithScreenName:(NSString *)screen
{
    self.navBarView.delegate = self;
	[self setContentWithDicName:screen];
    [self.navBarView setFrame:CGRectMake( 0, 0, 320, 44 )];
	[self.view addSubview:self.navBarView];
}


- (void) setContentWithDicName:(NSString *)dicName
{
	if ([dicName isEqualToString:SCREEN_HOME]) {
		[self.navBarView.lblTitle setText:[gAppDelegate getStringInScreen:SCREEN_HOME strID:STR_HOME_NAVTITLE]];
	}
    else if ([dicName isEqualToString:SCREEN_ELEMENT]) {
        [self.navBarView.lblTitle setText:[gAppDelegate getStringInScreen:SCREEN_ELEMENT strID:STR_ELEMENT_NAVTITLE]];
        [self.navBarView.rightButton setHidden:YES];
    }
}

- (void) resetElementsForMode:(BOOL)isPortrait {
    if (isPortrait) {
    }
    else {
    }
}


- (void) moveToMainView
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3f];
    [UIView setAnimationDelegate:self];
    
    [self.navigationController.view setUserInteractionEnabled:NO];
    self.navigationController.view.transform = CGAffineTransformIdentity;
    
    [UIView commitAnimations];
}

@end
