//
//  CustomPopView.h
//  Taxi
//
//  Created by Tapha Media Ltd on 9/6/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "SuperView.h"

@protocol CustomPopViewDelegate;

@interface CustomPopView : SuperView {
    IBOutlet UIButton * btnDetail;
    
    IBOutlet UIImageView * imgvwIndicator;
    
    NSMutableArray * arrOptions;
    NSMutableArray * arrDividers;
}
@property (nonatomic, assign) id<CustomPopViewDelegate> delegate;

- (void) setPopView:(NSArray *)options xPos:(int)xPos;

- (IBAction) button_click:(id)sender;

@end


@protocol CustomPopViewDelegate <NSObject>

- (void) didClickDetailOnPop:(CustomPopView *)cpv;
- (void) didClickOptionOnPop:(CustomPopView *)cpv index:(int)index;

@end