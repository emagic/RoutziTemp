//
//  ChatCell.m
//  Taxi
//
//  Created by Tapha Media Ltd on 9/6/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "ChatCell.h"
#import "UIImageView+WebCache.h"

@implementation ChatCell

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

- (void) setChatCell:(TaxiData *)data
{
    if (chkStatus == nil) {
        chkStatus = [[UICheckboxButton alloc] initWithFrame:CGRectMake( 55, 35, 17, 17 )];
        [chkStatus setText:@""];
        [chkStatus setCheckboxType:NO];
        [chkStatus setCheckBoxLeftType];
        [chkStatus setDelegate:self];
        [chkStatus setUserInteractionEnabled:NO];
        [self addSubview:chkStatus];
    }
    
    [lblTitle setText:data.strTitle];
    [lblDesc setText:data.strDesc];
    
    [chkStatus setChecked:data.online];
    
    [imgvwPhoto setImage:[UIImage imageNamed:data.strPhoto]];
//    [imgvwPhoto setImageWithURL:[NSURL URLWithString:imgURL]
//                      completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
//                          ;
//                      }];
    
    imgvwPhoto.layer.cornerRadius = 48 / 2;
    imgvwPhoto.layer.masksToBounds = YES;
    imgvwPhoto.layer.borderWidth = 1;
    imgvwPhoto.layer.borderColor = [UIColor clearColor].CGColor;
    
    
    
}

@end
