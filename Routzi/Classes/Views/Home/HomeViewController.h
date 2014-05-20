//
//  HomeViewController.h
//  Taxi
//
//  Created by Tapha Media Ltd on 9/5/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "CustomNavViewController.h"

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#import "HomeTabbarView.h"
#import "MapPinInfView.h"
#import "SearchView.h"
#import "PayView.h"
#import "CallView.h"

#import "ChatViewController.h"

@interface HomeViewController : CustomNavViewController<CLLocationManagerDelegate, MKMapViewDelegate, HomeTabbarViewDelegate, MapPinInfViewDelegate, SearchViewDelegate, PayViewDelegate, CallViewDelegate> {
    // Map Kit
    MKMapView * mainMapView;
    CLLocationManager * myCurrentLocation;
    CLLocationCoordinate2D myCurLocationCoord;
    
    MapPinInfView * pinInfView;
    
    int selectedPinIndex;
    NSMutableArray * arrPins;
    
    // Bottom Bar
    IBOutlet HomeTabbarView * tabbarView;
    
    //
    IBOutlet UIImageView * imgvwOverlay;
    
    // Search View
    SearchView * searchView;
    
    // Payment View
    PayView * payView;
    
    // Call View
    CallView * callView;
    
    // Right side
    ChatViewController * chatController;
}


- (void) setEnable:(BOOL)enable;

@end
