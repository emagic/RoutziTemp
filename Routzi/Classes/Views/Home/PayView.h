//
//  PayView.h
//  Taxi
//
//  Created by Tapha Media Ltd on 9/6/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "SuperView.h"

typedef enum {
    CARD_TYPE_VISA = 0,
    CARD_TYPE_AMEX = 1,
    CARD_TYPE_JCB = 2,
} CARD_TYPE;


@protocol PayViewDelegate;

@interface PayView : SuperView {
    IBOutlet UILabel * lblReceipt;
    IBOutlet UILabel * lblTime;
    
    IBOutlet UILabel * lblRide;
    IBOutlet UILabel * lblAmount;
    
    IBOutlet UILabel * lblPayment;
    
    IBOutlet UIImageView * imgvwPayment;
    
    IBOutlet UIButton * btnPay;
    
    IBOutlet UIImageView * imgvwBarcode;
    IBOutlet UILabel * lblBottom;
    
    IBOutlet UIButton * btnCancel;
}
@property (nonatomic, assign) id<PayViewDelegate> delegate;

- (void) setContentWith:(NSString *)strTime
                   ride:(int)ride
                 amount:(float)amount
                   card:(CARD_TYPE)card
                barcode:(NSString *)barcodeURL;


- (void) showInView:(UIView *)vw;
- (void) hide;


- (IBAction) button_click:(id)sender;

@end



@protocol PayViewDelegate <NSObject>

- (void) willShowPayView:(PayView *)pv;
- (void) willHidePayView:(PayView *)pv;

- (void) didConfirmToPay:(PayView *)pv;
- (void) didCancelToPay:(PayView *)pv;

@end