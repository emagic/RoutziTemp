//
//  HomeViewController.m
//  Taxi
//
//  Created by Tapha Media Ltd on 9/5/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "HomeViewController.h"

#define DEFAULT_DELTA_LATITUDE		2.503251334415576
#define DETAULT_DELTA_LONGITUDE		2.544970642713780

#import "PinButton.h"

@interface HomeViewController ()<UISearchBarDelegate>{

}

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self insertNavBarWithScreenName:SCREEN_HOME];
    
    tabbarView.delegate = self;
    
    // Initialize variables
    arrPins = [[NSMutableArray alloc] init];
    selectedPinIndex = NSNotFound;
    
    self.navBarView.searchBar.delegate = self;
   
}


- (void) viewDidAppear:(BOOL)animated
{
    if (mainMapView == nil) {
        mainMapView = [[MKMapView alloc] initWithFrame:CGRectMake( 0, 0, gScreenSize.width, gScreenSize.height )];
        mainMapView.delegate = self;
        [mainMapView setShowsUserLocation:YES];
        [self.view addSubview:mainMapView];
        
        [self getCurrentLocation];
    }
    
    [self.view bringSubviewToFront:self.navBarView];
    [self.view bringSubviewToFront:tabbarView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setEnable:(BOOL)enable
{
    [self.view setUserInteractionEnabled:enable];
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

- (void) resize
{
    [super resize];
    
    int offset = 20;
    if (gIOSVersion == IOS_7) {
        CGRect frm = self.navBarView.frame;
        frm.size.height += offset;
        [self.navBarView setFrame:frm];
    }
}



- (IBAction) pin_click:(id)sender
{
    int index = [arrPins indexOfObject:sender];
    
    if (index != NSNotFound) {
        PinButton * btn = (PinButton *)sender;
        
        if (pinInfView == nil) {
            pinInfView = (MapPinInfView *)[[MapPinInfView alloc] viewFromStoryboard];
            [pinInfView setFrame:CGRectMake( -500, -500, 204, 58 )];
            [pinInfView setAlpha:0.0f];
            [mainMapView addSubview:pinInfView];
        }
        
        [pinInfView setCenter:CGPointMake( btn.center.x, btn.center.y - pinInfView.frame.size.height )];
        [pinInfView setPinInf:8 taxi:@"Taxi 123232"];
     
        if (selectedPinIndex == index) {
            [pinInfView show:[pinInfView isDisappeared]];
            
            if ([pinInfView isDisappeared]) {
                selectedPinIndex = NSNotFound;
            }
            else {
                selectedPinIndex = index;
            }
        }
        else {
            if ([pinInfView isDisappeared]) {
                [pinInfView show:YES];
                
                selectedPinIndex = index;
            }
        }
    }
}



#pragma mark -- 
#pragma mark -- NavBar Delegate --

- (void) didClickNavBarLeftButton
{

    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3f];
    [UIView setAnimationDelegate:self];
    CGRect frm = self.view.frame;

    if (frm.origin.x==0) {
        frm.origin.x = 253;
    }
    else{
        frm.origin.x = 0;
    }
    [self.view setFrame:frm];

    [UIView commitAnimations];
}


- (void) didClickNavBarRightButton
{
//    if (chatController == nil) {
//        chatController = (ChatViewController *)[[ChatViewController alloc] viewFromStoryboard];
//        [self.view.superview addSubview:chatController.view];
//        [chatController.view setFrame:CGRectMake( 320, 0, gScreenSize.width, gScreenSize.height )];
//    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    
//    if (self.view.frame.origin.x > -253) {
//        self.view.transform = CGAffineTransformMakeTranslation( -253 * 2, 0 );
//        chatController.view.transform = CGAffineTransformMakeTranslation( -253, 0 );
//    }
//    else {
//        self.view.transform = CGAffineTransformMakeTranslation( -253, 0 );
//        chatController.view.transform = CGAffineTransformMakeTranslation( 0, 0 );
//    }
    self.navBarView.searchBar.hidden = NO;
    
    [UIView commitAnimations];
    
    CGRect frame = self.navBarView.searchBar.frame;
    frame.origin.x = 240;
    frame.size.width = 80;
    self.navBarView.searchBar.frame = frame;
    self.navBarView.searchBar.alpha = 0;
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         self.navBarView.searchBar.frame = CGRectMake(0, 20, 320, 44);
                         self.navBarView.searchBar.alpha = 1;
                     }
                     completion:^(BOOL finished) {
                         self.navBarView.searchBar.hidden = NO;
                         [self.navBarView.searchBar becomeFirstResponder];

                     }];

}


#pragma mark --
#pragma mark -- UISearchBarDelegate --

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar{
    
    
    CGRect frame = self.navBarView.searchBar.frame;
    frame.origin.x = 240;
    frame.size.width = 80;
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         [self.navBarView.searchBar resignFirstResponder];
                         self.navBarView.searchBar.frame = frame;
                         self.navBarView.searchBar.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         self.navBarView.searchBar.hidden = YES;
                     }];

}


#pragma mark --
#pragma mark -- MKMapViewDelegate Methods --

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}



- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error
{
	NSLog(@"MapView: Loading failed!...");
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}


- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}



- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
	if (![mainMapView isUserInteractionEnabled]) {
		return;
	}
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.2f];
	[UIView setAnimationDelegate:self];
	
	// Change detailview's frame
	for (int i = 0; i < [arrPins count]; i++) {
		PinButton *btn = [arrPins objectAtIndex:i];
		
		CGPoint pos = [self getPositionInMapFrom:CLLocationCoordinate2DMake( btn.latitude, btn.longitude )];
		
		[btn setCenter:CGPointMake( pos.x, pos.y - btn.frame.size.height / 2 )];
		
		if ((selectedPinIndex == i) && (![pinInfView isHidden])){
			[pinInfView setCenter:CGPointMake( btn.center.x, btn.center.y - pinInfView.frame.size.height )];
		}
	}
	
	[UIView commitAnimations];
}


/*=========================================================================
 *
 *   Search the center detail of refkey
 *  ------------------------------------------------------
 *
 *	@parameters:
 *		CLLocationCoordinate2D newCoord : coodrdinate in map
 *
 *	@returns: CGPoint
 *				point in mapView
 *
 ===========================================================================*/
-(CGPoint) getPositionInMapFrom:(CLLocationCoordinate2D)newCoord
{
	MKCoordinateRegion region = mainMapView.region;
	MKCoordinateSpan span = region.span;
	CLLocationCoordinate2D center = region.center;
	
	// Left-top coordinate.
	CLLocationCoordinate2D leftTopCoord;
	leftTopCoord.latitude = center.latitude + span.latitudeDelta / 2;
	leftTopCoord.longitude = center.longitude - span.longitudeDelta / 2;
	
	// Get Point
	CGSize mapSize = mainMapView.frame.size;
	float x = (newCoord.longitude - leftTopCoord.longitude) * (mapSize.width / span.longitudeDelta);
	float y = -(newCoord.latitude - leftTopCoord.latitude) * (mapSize.height / span.latitudeDelta);
	
	return CGPointMake( x, y );
}


#pragma mark --
#pragma mark -- CLLocationManagerDelegate Methods --

// This delegate method will be invoked when the location is successfully updated.
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
	// Save changed current location
	myCurLocationCoord = newLocation.coordinate;
    
    MKCoordinateRegion defaultRegion = MKCoordinateRegionMake(myCurLocationCoord, MKCoordinateSpanMake( DEFAULT_DELTA_LATITUDE, DETAULT_DELTA_LONGITUDE));
	[mainMapView setRegion:defaultRegion];
    
    // Remove original Pins
    for ( int i = 0; i < [arrPins count]; i++) {
        PinButton * btnPin = [arrPins objectAtIndex:i];
        
        [btnPin removeFromSuperview];
    }
    [arrPins removeAllObjects];
    
    // Add New Pins
    PinButton * btnPin = [PinButton buttonWithType:UIButtonTypeCustom];
    [btnPin setImage:[UIImage imageNamed:@"home_map_pin"] forState:UIControlStateNormal];
    CGPoint pt = [self getPositionInMapFrom:myCurLocationCoord];
    [btnPin setFrame:CGRectMake( pt.x, pt.y, 14, 37 )];
    [btnPin setCenter:CGPointMake( pt.x, pt.y - btnPin.frame.size.height / 2 )];
    [btnPin addTarget:self action:@selector(pin_click:) forControlEvents:UIControlEventTouchUpInside];
    btnPin.latitude = myCurLocationCoord.latitude;
    btnPin.longitude= myCurLocationCoord.longitude;
    btnPin.strPhone = @"+44 8718718710";
    [arrPins addObject:btnPin];
    
    [mainMapView addSubview:btnPin];
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
#pragma mark -- HomeTabbarViewDelegate -- 

- (void) didClickSearch:(HomeTabbarView *)htv
{
    if (searchView == nil) {
        searchView = (SearchView *)[[SearchView alloc] viewFromStoryboard];
        searchView.delegate = self;
        [searchView initialize];
    }
    
    [self.view bringSubviewToFront:imgvwOverlay];
    [searchView showInView:self.view];
}


- (void) didClickPhone:(HomeTabbarView *)htv
{
    if (callView == nil) {
        callView = (CallView *)[[CallView alloc] viewFromStoryboard];
        callView.delegate = self;
    }
    
    if (selectedPinIndex == NSNotFound) {
        [gAppDelegate showAlertWithTitle:@"Take Photo"
                                 message:@""
                                receiver:self
                       cancelButtonTitle:@"Ok"
                            otherButtons:nil];
        
        return;
    }
    
    PinButton * pin = [arrPins objectAtIndex:selectedPinIndex];
    
    [callView setCallView:pin.strPhone];
    
    [self.view bringSubviewToFront:imgvwOverlay];
    [callView showInView:self.view];
}



#pragma mark --
#pragma mark -- MapPinInfViewDelegate --

- (void) willShowPinDetail:(MapPinInfView *)mpiv
{
    ;
}



#pragma mark --
#pragma mark -- SearchViewDelegate --

- (void) willShow:(SearchView *)sv
{
    [self.navBarView setUserInteractionEnabled:NO];
    [tabbarView setUserInteractionEnabled:NO];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationDelegate:self];
    
    imgvwOverlay.alpha = 1.0f;
    
    [UIView commitAnimations];
}

- (void) willHide:(SearchView *)sv
{
    [self.navBarView setUserInteractionEnabled:YES];
    [tabbarView setUserInteractionEnabled:YES];
    
    // Hide overlay view
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationDelegate:self];
    
    imgvwOverlay.alpha = 0.0f;
    
    [UIView commitAnimations];
}



- (void) willCancel:(SearchView *)sv
{
    ;
}


- (void) willReserve:(SearchView *)sv
                from:(NSString *)from
                  to:(NSString *)to
            memberSz:(MEMBER_SIZE)sz
             payment:(PAYMENT_TYPE)payment
{
    if (payView == nil) {
        payView = (PayView *)[[PayView alloc] viewFromStoryboard];
        payView.delegate = self;
    }
    
    [payView setContentWith:@"03/09/2013"
                       ride:1
                     amount:40.0f
                       card:CARD_TYPE_VISA
                    barcode:@""];
    
    [payView showInView:self.view];
}



#pragma mark --
#pragma mark -- PayViewDelegate --

- (void) willShowPayView:(PayView *)pv
{
    [self.navBarView setUserInteractionEnabled:NO];
    
    searchView.delegate = nil;
    [searchView hide];
}


- (void) willHidePayView:(PayView *)pv
{
    ;
}


- (void) didConfirmToPay:(PayView *)pv
{
    [self.navBarView setUserInteractionEnabled:YES];
    // Hide overlay view
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationDelegate:self];
    
    imgvwOverlay.alpha = 0.0f;
    
    [UIView commitAnimations];
}


- (void) didCancelToPay:(PayView *)pv
{
    searchView.delegate = self;
    [searchView showInView:self.view];
}




#pragma mark --
#pragma mark -- CallViewDelegate --

- (void) willShowCallView:(CallView *)cv
{
    [self.navBarView setUserInteractionEnabled:NO];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationDelegate:self];
    
    imgvwOverlay.alpha = 1.0f;
    
    [UIView commitAnimations];
}


- (void) willHideCallView:(CallView *)cv
{
    [self.navBarView setUserInteractionEnabled:YES];
    
    // Hide overlay view
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationDelegate:self];
    
    imgvwOverlay.alpha = 0.0f;
    
    [UIView commitAnimations];
}


- (void) didConfirmToCall:(CallView *)cv phone:(NSString *)strPhone
{
    [self.navBarView setUserInteractionEnabled:YES];
    
    // Hide overlay view
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationDelegate:self];
    
    imgvwOverlay.alpha = 0.0f;
    
    [UIView commitAnimations];
    
    // Phone Call
    NSString *phoneURLString = [NSString stringWithFormat:@"tel:%@", strPhone];
    NSURL *phoneURL = [NSURL URLWithString:phoneURLString];
    [[UIApplication sharedApplication] openURL:phoneURL];
}


- (void) didCancelToCall:(CallView *)cv
{
    [searchView showInView:self.view];
}



@end
