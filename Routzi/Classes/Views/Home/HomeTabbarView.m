//
//  HomeTabbarView.m
//  Taxi
//
//  Created by Tapha Media Ltd on 9/6/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "HomeTabbarView.h"

@implementation HomeTabbarView

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

- (IBAction) button_click:(id)sender
{
    if ([sender isEqual:btnPhone]) {
        if (self.delegate) {
            if ([self.delegate respondsToSelector:@selector(didClickPhone:)]) {
                [self.delegate didClickPhone:self];
            }
        }
    }
    else if ([sender isEqual:btnSearch]) {
        if (self.delegate) {
            if ([self.delegate respondsToSelector:@selector(didClickSearch:)]) {
                [self.delegate didClickSearch:self];
            }
        }
    }
}

@end
