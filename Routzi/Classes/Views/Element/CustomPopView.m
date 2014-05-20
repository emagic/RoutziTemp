//
//  CustomPopView.m
//  Taxi
//
//  Created by Tapha Media Ltd on 9/6/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "CustomPopView.h"

@implementation CustomPopView

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

- (void) setPopView:(NSArray *)options xPos:(int)xPos
{
    // Initialize
    if (arrOptions == nil) {
        arrOptions = [[NSMutableArray alloc] init];
    }
    else {
        for ( int i = 0; i < [arrOptions count]; i++ ) {
            UIButton * btn = [arrOptions objectAtIndex:i];
            [btn removeFromSuperview];
        }
        [arrOptions removeAllObjects];
    }
    
    if (arrDividers == nil) {
        arrDividers = [[NSMutableArray alloc] init];
    }
    else {
        for ( int i = 0; i < [arrDividers count]; i++ ) {
            UIImageView * divider = [arrDividers objectAtIndex:i];
            [divider removeFromSuperview];
        }
        [arrDividers removeAllObjects];
    }
    
    if (options == nil) {
        return;
    }
    
    // Add buttons
    int totalWidth = 0;
    for ( int i = 0; i < [options count]; i++ ) {
        NSString * strTitle = [options objectAtIndex:i];
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [btn setTitle:strTitle forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:13.0f]];
        [btn addTarget:self action:@selector(button_click:) forControlEvents:UIControlEventTouchUpInside];
        [btn setFrame:CGRectMake( 0, 100, 100, 36 )];
        [self addSubview:btn];
        
        [arrOptions addObject:btn];
        
        UIImageView * imgvwDivider = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pop_divider"]];
        [imgvwDivider setFrame:CGRectMake( 0, 100, 1, 36 )];
        [self addSubview:imgvwDivider];
        [arrDividers addObject:imgvwDivider];
        
        // Calc width
        totalWidth += [gAppDelegate getRealWidthFrom:36.0f
                                             content:strTitle
                                                font:btn.titleLabel.font
                                       lineBreakMode:NSLineBreakByWordWrapping];
    }
    
    int space = ((self.frame.size.width - 30) - totalWidth) / ( [options count] * 2 );
    
    int x = 0;
    for ( int i = 0; i < [arrOptions count]; i++ ) {
        UIButton * btn = [arrOptions objectAtIndex:i];
        int width = [gAppDelegate getRealWidthFrom:36.0f
                                            content:btn.titleLabel.text
                                            font:btn.titleLabel.font
                                   lineBreakMode:NSLineBreakByWordWrapping];
        [btn setFrame:CGRectMake( x, 0, width + space * 2, 36 )];
        
        x += space * 2 + width;
        
        UIImageView * divider = [arrDividers objectAtIndex:i];
        
        if (i == [arrOptions count] - 1) {
            [divider setFrame:CGRectMake( 270, 0, 1, 36 )];
        }
        else {
            [divider setFrame:CGRectMake( x, 0, 1, 36 )];
        }
    }
    
    [imgvwIndicator setFrame:CGRectMake( xPos, 36, imgvwIndicator.frame.size.width, imgvwIndicator.frame.size.height )];
}


- (IBAction) button_click:(id)sender
{
    if ([sender isEqual:btnDetail]) {
        if (self.delegate) {
            if ([self.delegate respondsToSelector:@selector(didClickDetailOnPop:)]) {
                [self.delegate didClickDetailOnPop:self];
            }
        }
    }
    else {
        int index = [arrOptions indexOfObject:sender];
        
        if (index != NSNotFound) {
            if (self.delegate) {
                if ([self.delegate respondsToSelector:@selector(didClickOptionOnPop:index:)]) {
                    [self.delegate didClickOptionOnPop:self index:index];
                }
            }
        }
    }
}

@end
