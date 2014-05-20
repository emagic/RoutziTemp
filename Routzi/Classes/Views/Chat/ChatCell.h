//
//  ChatCell.h
//  Taxi
//
//  Created by Tapha Media Ltd on 9/6/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "SuperTableCell.h"

#import "UICheckboxButton.h"

@interface ChatCell : SuperTableCell<UICheckboxButtonDelegate> {
    IBOutlet UIImageView * imgvwPhoto;
    IBOutlet UILabel * lblTitle;
    IBOutlet UILabel * lblDesc;
    IBOutlet UIImageView * imgvwArrow;
    
    UICheckboxButton * chkStatus;
}


- (void) setChatCell:(TaxiData *)data;

@end
