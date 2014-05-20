//
//  CallView.h
//  Taxi
//
//  Created by Tapha Media Ltd on 9/6/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "SuperView.h"

@protocol CallViewDelegate;

@interface CallView : SuperView {
    IBOutlet UIButton * btnPhone;
    IBOutlet UIButton * btnCancel;
    
    NSString * strPhone;
}
@property (nonatomic, assign) id<CallViewDelegate> delegate;

- (void) setCallView:(NSString *)phone;

- (void) showInView:(UIView *)vw;
- (void) hide;

- (IBAction) button_click:(id)sender;

@end


@protocol CallViewDelegate <NSObject>

- (void) willShowCallView:(CallView *)cv;
- (void) willHideCallView:(CallView *)cv;

- (void) didConfirmToCall:(CallView *)cv phone:(NSString *)strPhone;
- (void) didCancelToCall:(CallView *)cv;

@end