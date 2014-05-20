//
//  MenuCell.m
//  Taxi
//
//  Created by Tapha Media Ltd on 9/5/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "MenuCell.h"

@implementation MenuCell

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


- (void) setCellContentWith:(MenuCellType) type
{
    if (viewSelected == nil) {
        viewSelected = [[UIView alloc] initWithFrame:CGRectMake( 0, 0, 253, 44 )];
        [viewSelected setBackgroundColor:[UIColor colorWithRed:255.0f/255.0f green:220.0f/255.0f blue:0.0f/255.0f alpha:1.0f]];
        [self setSelectedBackgroundView:viewSelected];
    }
    
    [lblTitle setText:[gAppDelegate getStringInScreen:SCREEN_MENU strID:[NSString stringWithFormat:@"CELL_ROW%d", type + 1]]];
    
    [imgvwIcon setImage:[UIImage imageNamed:[NSString stringWithFormat:@"menu_cell_icon_%d", type + 1]]];
}


@end
