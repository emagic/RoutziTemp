//
//  ViewController.m
//  Taxi
//
//  Created by Tapha Media Ltd on 9/5/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Do any additional setup after loading the view, typically from a nib.
    [loadingView setCenter:CGPointMake( self.view.frame.size.width / 2, self.view.frame.size.height / 2 )];
    
    [self resize];
    
    [imgvwBG setImageWithOptions:@"splash" options:IMAGE_OPTION_DEVICE | IMAGE_OPTION_RETINA use568h:YES];
    
    [loadingView startAnimating];
	[NSThread detachNewThreadSelector:@selector(tryToLoad) toTarget:self withObject:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) tryToLoad
{
	@autoreleasepool {
        sleep(1);
        
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"gotoMenuView" object:@"SplashView"];
        [loadingView stopAnimating];
    }
}


- (void) resize
{
    if (gIOSVersion <= IOS_6) {
        [imgvwBG setFrame:CGRectMake( 0, -20, gScreenSize.width, gScreenSize.height )];
    }
}


@end
