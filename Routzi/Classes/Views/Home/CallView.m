//
//  CallView.m
//  Taxi
//
//  Created by Tapha Media Ltd on 9/6/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "CallView.h"

@implementation CallView

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



- (void) setCallView:(NSString *)phone
{
    // UI Element Initialize
    [self setFrame:CGRectMake( 0, 1200, 320, 107 )];
    
    strPhone = phone;
    
    [btnPhone setTitle:[NSString stringWithFormat:@"Call %@", phone] forState:UIControlStateNormal];
    [btnCancel setTitle:[gAppDelegate getStringInScreen:SCREEN_HOME strID:STR_HOME_PAY_CANCEL]
               forState:UIControlStateNormal];
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
        if ([self.delegate respondsToSelector:@selector(willShowCallView:)]) {
            [self.delegate willShowCallView:self];
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
        if ([self.delegate respondsToSelector:@selector(willHideCallView:)]) {
            [self.delegate willHideCallView:self];
        }
    }
}


- (IBAction) button_click:(id)sender
{
    if ([sender isEqual:btnCancel]) {
        if (self.delegate) {
            if ([self.delegate respondsToSelector:@selector(didCancelToCall:)]) {
                [self.delegate didCancelToCall:self];
            }
        }
        
        [self hide];
    }
    else if ([sender isEqual:btnPhone]) {
        if (self.delegate) {
            if ([self.delegate respondsToSelector:@selector(didConfirmToCall:phone:)]) {
                [self.delegate didConfirmToCall:self phone:strPhone];
            }
        }
        
        [self hide];
    }
}


@end
