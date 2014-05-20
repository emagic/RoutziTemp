//
//  HomeTabbarView.h
//  Taxi
//
//  Created by Tapha Media Ltd on 9/6/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "SuperView.h"

@protocol HomeTabbarViewDelegate;

@interface HomeTabbarView : SuperView {
    IBOutlet UIImageView * imgvwCheck;
    
    IBOutlet UIButton * btnSearch;
    IBOutlet UIButton * btnPhone;
}
@property (nonatomic, assign) id<HomeTabbarViewDelegate> delegate;

- (IBAction) button_click:(id)sender;

@end

@protocol HomeTabbarViewDelegate <NSObject>

- (void) didClickSearch:(HomeTabbarView *)htv;
- (void) didClickPhone:(HomeTabbarView *)htv;

@end