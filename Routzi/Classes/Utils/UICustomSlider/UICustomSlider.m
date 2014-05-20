//
//  UICustomSlider.m
//
//  Created by Tapha Media Ltd on 3/8/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "UICustomSlider.h"

@implementation UICustomSlider

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setBackgroundColor:[UIColor clearColor]];
        UIImage *imgleftFill = [[UIImage imageNamed:@"slider_fill.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0];
        UIImage *imgrightFill = [[UIImage imageNamed:@"slider_bg.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0];
        UIImage *imgIndicator = [UIImage imageNamed:@"slider_cursor.png"];
        
        [self setThumbImage:imgIndicator forState:UIControlStateNormal];
        [self setMinimumTrackImage:imgleftFill forState:UIControlStateNormal];
        [self setMaximumTrackImage:imgrightFill forState:UIControlStateNormal];
        
        [self setMinimumValue:0.0f];
        [self setMaximumValue:100.0f];
        [self setContinuous:YES];
        [self setValue:50.0f];
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

@end
