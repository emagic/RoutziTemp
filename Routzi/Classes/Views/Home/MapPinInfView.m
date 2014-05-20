//
//  MapPinInfView.m
//  Taxi
//
//  Created by Tapha Media Ltd on 9/6/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "MapPinInfView.h"

@implementation MapPinInfView

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


- (void) setPinInf:(int) minute taxi:(NSString *)taxiname
{
    [lblTaxi setText:taxiname];
    [lblTime setText:[NSString stringWithFormat:@"%d min", minute]];
}


- (IBAction) indicator_click:(id)sender
{
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(willShowPinDetail:)]) {
            [self.delegate willShowPinDetail:self];
        }
    }
}


- (void) show:(BOOL)show
{
    [self setAlpha:show ? 0.0f : 1.0f];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3f];
    [UIView setAnimationDelegate:self];
    
    self.alpha = (show) ? 1.0f : 0.0f;
    
    [UIView commitAnimations];
    
    if (show) {
        [self setHidden:NO];
    }
}

- (BOOL) isDisappeared
{
    return ([self isHidden] || self.alpha == 0.0f );
}

@end
