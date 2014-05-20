//
//  SearchView.h
//  Taxi
//
//  Created by Tapha Media Ltd on 9/6/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "SuperView.h"
#import "CustomSegmentedControl.h"
#import <CoreLocation/CoreLocation.h>


typedef enum {
    PAYMENT_TYPE_CASH = 0,
    PAYMENT_TYPE_CARD = 1,
    PAYMENT_TYPE_ACCOUNT = 2,
} PAYMENT_TYPE;


typedef enum {
    MEMBER_SIZE_ALONE = 0,
    MEMBER_SIZE_2To5 = 1,
    MEMBER_SIZE_6 = 2,
} MEMBER_SIZE;


@protocol SearchViewDelegate;

@interface SearchView : SuperView <CustomSegmentedControlDelegate, CLLocationManagerDelegate> {
    IBOutlet UILabel * lblTitle;
    IBOutlet UIButton * btnCancel;

    IBOutlet UILabel * lblFrom;
    IBOutlet UIButton * btnCurLocation;
    IBOutlet UILabel * lblTo;
    
    IBOutlet UITextField * txtFrom;
    IBOutlet UITextField * txtTo;
    
    CustomSegmentedControl * segmentMembers;
    CustomSegmentedControl * segmentPayments;
    
    IBOutlet UIButton * btnReserve;
    
    // Location
    CLLocationManager * myCurrentLocation;
    CLLocationCoordinate2D myCurLocationCoord;
    
    MEMBER_SIZE selectedMemberSZ;
    PAYMENT_TYPE selectedPayment;
}
@property (nonatomic, assign) id<SearchViewDelegate> delegate;


- (void) initialize;

- (void) showInView:(UIView *)vw;
- (void) hide;

- (IBAction) button_click:(id)sender;

@end


@protocol SearchViewDelegate <NSObject>

- (void) willShow:(SearchView *)sv;
- (void) willHide:(SearchView *)sv;

- (void) willCancel:(SearchView *)sv;
- (void) willReserve:(SearchView *)sv
                from:(NSString *)from
                  to:(NSString *)to
            memberSz:(MEMBER_SIZE)sz
             payment:(PAYMENT_TYPE)payment;

@end