//
//  SearchView.m
//  Taxi
//
//  Created by Tapha Media Ltd on 9/6/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "SearchView.h"

@implementation SearchView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/



- (void) initialize
{
    [self setFrame:CGRectMake( 0, 1200, 320, 352 )];
    
    [lblTitle setText:[gAppDelegate getStringInScreen:SCREEN_HOME strID:STR_HOME_SEARCH_TITLE]];
    [lblFrom setText:[gAppDelegate getStringInScreen:SCREEN_HOME strID:STR_HOME_SEARCH_TXT_FROM]];
    [lblTo setText:[gAppDelegate getStringInScreen:SCREEN_HOME strID:STR_HOME_SEARCH_TXT_TO]];
    
    [btnCancel setTitle:[gAppDelegate getStringInScreen:SCREEN_HOME strID:STR_HOME_SEARCH_BTN_CANCEL] forState:UIControlStateNormal];
    [btnReserve setTitle:[gAppDelegate getStringInScreen:SCREEN_HOME strID:STR_HOME_SEARCH_BTN_RESERVE] forState:UIControlStateNormal];
    
//    segmentMembers = [[CustomSegmentedControl alloc] init];
//    [segmentMembers setSegmentWithCount:3
//                            segmentsize:CGSizeMake( 100, 29 )
//                           dividerImage:nil
//                                    tag:9001
//                               delegate:self];
//    [segmentMembers setFrame:CGRectMake( 10, 180, 300, 29 )];
//    [self addSubview:segmentMembers];
//    
//    segmentPayments = [[CustomSegmentedControl alloc] init];
//    [segmentPayments setSegmentWithCount:3
//                             segmentsize:CGSizeMake( 100, 29 )
//                            dividerImage:nil
//                                     tag:9001
//                                delegate:self];
//    [segmentPayments setFrame:CGRectMake( 10, 237, 300, 29 )];
//    [self addSubview:segmentPayments];
}


- (void) showInView:(UIView *)vw
{
    if (vw == nil) {
        return;
    }
    
    [self setAlpha:0.0f];
    
    [vw addSubview:self];
    [self setCenter:CGPointMake( vw.frame.size.width / 2, vw.frame.size.height / 2 )];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationDelegate:self];
    
    self.alpha = 1.0f;
    
    [UIView commitAnimations];
    
    
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(willShow:)]) {
            [self.delegate willShow:self];
        }
    }
}


- (void) hide
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationDelegate:self];
    
    self.alpha = 0.0f;
    
    [UIView setAnimationDidStopSelector:@selector(didHide)];
    
    [UIView commitAnimations];
}


- (void) didHide
{
    [self removeFromSuperview];
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(willHide:)]) {
            [self.delegate willHide:self];
        }
    }
}


- (IBAction) button_click:(id)sender
{
    if ([sender isEqual:btnCancel]) {
        if (self.delegate) {
            if ([self.delegate respondsToSelector:@selector(willCancel:)]) {
                [self.delegate willCancel:self];
            }
            [self hide];
        }
    }
    else if ([sender isEqual:btnReserve]) {
        if (self.delegate) {
            if ([self.delegate respondsToSelector:@selector(willCancel:)]) {
                [self.delegate willCancel:self];

            }
            [self hide];

        }
    }
    else if ([sender isEqual:btnCurLocation]) {
        [self getCurrentLocation];
    }
}



- (void) getCurrentLocation
{
    // Get Current Location
    if ( [CLLocationManager locationServicesEnabled] == NO )
	{
		NSLog(@"Service not provided.");
        
	} else {
		myCurrentLocation = [[CLLocationManager alloc] init];
		myCurrentLocation.delegate = self;
		myCurrentLocation.desiredAccuracy = kCLLocationAccuracyBest;
		[myCurrentLocation startUpdatingLocation];
	}
}



#pragma mark --
#pragma mark -- CLLocationManagerDelegate Methods --

// This delegate method will be invoked when the location is successfully updated.
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
	// Save changed current location
	myCurLocationCoord = newLocation.coordinate;

    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        CLPlacemark * plcMark = ((CLPlacemark *)[placemarks objectAtIndex:0]);
        if (plcMark != nil) {
            [txtFrom setText:plcMark.name];
        }
    }];
}




// This delegate method will be invoked if an error occured
// during seeking location.
// There is no need to handle all errors.
// But if you want to handle more, write the code here.
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
	switch ( [error code] )
	{
		case kCLErrorLocationUnknown :	// Location is currently unknown, but CL will keep trying
			NSLog(@"CLLocationManager -> Location is currently unknown, but CL will keep trying");
			break;
			
		case kCLErrorDenied :			// CL access has been denied (eg, user declined location use)
			NSLog(@"CLLocationManager -> CL access has been denied, that is, user chose \"Don't Allow\".");
			break;
			
		case kCLErrorNetwork :			// general, network-related error
			NSLog(@"CLLocationManager -> general, network-related error");
			break;
			
		case kCLErrorHeadingFailure :	// heading could not be determined
			NSLog(@"CLLocationManager -> heading could not be determined");
			break;
			
		default : // otherwise
			NSLog(@"CLLocationManager -> otherwise(undefined error)");
	}
}





#pragma mark --
#pragma mark -- UITextFieldDelegate --

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    ;
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    ;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}




#pragma mark --
#pragma mark -- CustomSegmentedControlDelegate --

- (UIButton*) buttonFor:(CustomSegmentedControl*)segmentedControl atIndex:(NSUInteger)segmentIndex
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if ([segmentedControl isEqual:segmentMembers]) {
        [btn setFrame:CGRectMake( 0, 0, 100, 29 )];

        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"search_seg_people_%d.png", segmentIndex + 1]]
                       forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"search_seg_people_%d_selected.png", segmentIndex + 1]]
                       forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor colorWithRed:1.0f green:225/255.0f blue:0.0f alpha:1.0f]
                  forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:16.0f]];
        
        if (segmentIndex == 0) {
            [btn setTitle:[NSString stringWithFormat:@"  %@", [gAppDelegate getStringInScreen:SCREEN_HOME strID:STR_HOME_SEARCH_MEM_1]]
                 forState:UIControlStateNormal];
            [btn setSelected:YES];
        }
        else if (segmentIndex == 1) {
            [btn setTitle:[NSString stringWithFormat:@"     %@", [gAppDelegate getStringInScreen:SCREEN_HOME strID:STR_HOME_SEARCH_MEM_2_5]]
                 forState:UIControlStateNormal];
            [btn setSelected:NO];
        }
        else {
            [btn setTitle:[NSString stringWithFormat:@"  %@", [gAppDelegate getStringInScreen:SCREEN_HOME strID:STR_HOME_SEARCH_MEM_6]]
                 forState:UIControlStateNormal];
            [btn setSelected:NO];
        }
        
        selectedMemberSZ = segmentIndex;
    }
    else if ([segmentedControl isEqual:segmentPayments]) {
        [btn setFrame:CGRectMake( 0, 0, 100, 29 )];
        
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"search_seg_pay_%d.png", segmentIndex + 1]]
                       forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"search_seg_pay_%d_selected.png", segmentIndex + 1]]
                       forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor colorWithRed:1.0f green:225/255.0f blue:0.0f alpha:1.0f]
                  forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:16.0f]];
        
        if (segmentIndex == 0) {
            [btn setTitle:[gAppDelegate getStringInScreen:SCREEN_HOME strID:STR_HOME_SEARCH_PAY_CASH]
                 forState:UIControlStateNormal];
            [btn setSelected:NO];
        }
        else if (segmentIndex == 1) {
            [btn setTitle:[gAppDelegate getStringInScreen:SCREEN_HOME strID:STR_HOME_SEARCH_PAY_CARD]
                 forState:UIControlStateNormal];
            [btn setSelected:YES];
        }
        else {
            [btn setTitle:[gAppDelegate getStringInScreen:SCREEN_HOME strID:STR_HOME_SEARCH_PAY_ACCOUNT]
                 forState:UIControlStateNormal];
            [btn setSelected:NO];
        }
        
        selectedPayment = segmentIndex;
    }
    
    
    return btn;
}

- (void) touchUpInsideSegment:(CustomSegmentedControl *)segmentedControl index:(NSUInteger)segmentIndex
{
    if ([segmentedControl isEqual:segmentMembers]) {
        selectedMemberSZ = segmentIndex;
    }
    else {
        selectedPayment = segmentIndex;
    }
}

@end
