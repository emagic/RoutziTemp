//
//  MenuCell.h
//  Taxi
//
//  Created by Tapha Media Ltd on 9/5/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "SuperTableCell.h"

typedef enum {
    MenuCellTaxi = 0,
    MenuCellRecent = 1,
    MenuCellCosts = 2,
    MenuCellFavor = 3,
    MenuCellContact = 4,
    MenuCellSetting = 5,
} MenuCellType;

@interface MenuCell : SuperTableCell {
    IBOutlet UIImageView * imgvwIcon;
    IBOutlet UILabel * lblTitle;
    
    UIView * viewSelected;
}

- (void) setCellContentWith:(MenuCellType) type;

@end
