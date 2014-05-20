//
//  PayView.m
//  Taxi
//
//  Created by Tapha Media Ltd on 9/6/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "PayView.h"

@implementation PayView

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

- (void) setContentWith:(NSString *)strTime
                   ride:(int)ride
                 amount:(float)amount
                   card:(CARD_TYPE)card
                barcode:(NSString *)barcodeURL
{
    // UI Element Initialize
    [self setFrame:CGRectMake( 0, 1200, 320, 352 )];
    
    [lblReceipt setText:[gAppDelegate getStringInScreen:SCREEN_HOME strID:STR_HOME_PAY_RECEIPT]];
    [lblPayment setText:[gAppDelegate getStringInScreen:SCREEN_HOME strID:STR_HOME_PAY_CARD]];
    [lblBottom  setText:[gAppDelegate getStringInScreen:SCREEN_HOME strID:STR_HOME_PAY_BTM]];
    [btnPay setTitle:[gAppDelegate getStringInScreen:SCREEN_HOME strID:STR_HOME_PAY_BTN]
            forState:UIControlStateNormal];
    [btnCancel setTitle:[gAppDelegate getStringInScreen:SCREEN_HOME strID:STR_HOME_PAY_CANCEL]
               forState:UIControlStateNormal];
    
    // Set values
    [lblTime setText:[NSString stringWithFormat:@"Date: %@", strTime]];
    [lblAmount setText:[NSString stringWithFormat:@"$ %.2f", amount]];
    [lblRide setText:[NSString stringWithFormat:@"%d Ride", ride]];
    
    [imgvwPayment setImage:[UIImage imageNamed:[NSString stringWithFormat:@"payment_card_icon_%d", card + 1]]];
//    [imgvwBarcode setImage:];
}


- (IBAction) button_click:(id)sender
{
    if ([sender isEqual:btnCancel]) {
        if (self.delegate) {
            if ([self.delegate respondsToSelector:@selector(didCancelToPay:)]) {
                [self.delegate didCancelToPay:self];
            }
        }
        
        [self hide];
    }
    else if ([sender isEqual:btnPay]) {
        if (self.delegate) {
            if ([self.delegate respondsToSelector:@selector(didConfirmToPay:)]) {
                [self.delegate didConfirmToPay:self];
            }
        }
        
        [self hide];
    }
}


- (void) showInView:(UIView *)vw
{
    if (vw == nil) {
        return;
    }
    
    [self setAlpha:0.0f];
    
    [vw addSubview:self];
    
    CGRect frm = self.frame;
    frm.origin.y = vw.frame.size.height - frm.size.height;
    [self setFrame:frm];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationDelegate:self];
    
    self.alpha = 1.0f;
    
    [UIView commitAnimations];
    
    
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(willShowPayView:)]) {
            [self.delegate willShowPayView:self];
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
        if ([self.delegate respondsToSelector:@selector(willHidePayView:)]) {
            [self.delegate willHidePayView:self];
        }
    }
}

@end
