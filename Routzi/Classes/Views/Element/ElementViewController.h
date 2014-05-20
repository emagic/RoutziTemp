//
//  ElementViewController.h
//  Taxi
//
//  Created by Tapha Media Ltd on 9/6/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "CustomNavViewController.h"

#import "UICheckboxButton.h"
#import "UICustomSlider.h"
#import "UICustomSwitch.h"
#import "CustomSegmentedControl.h"
#import "CustomPopView.h"

@interface ElementViewController : CustomNavViewController<CustomSegmentedControlDelegate, UICheckboxButtonDelegate, CustomPopViewDelegate> {
    
    UICustomSwitch * switchOn;
    UICustomSwitch * switchOff;
    
    UICustomSlider * slider;
    
    UICheckboxButton * chkUnChecked;
    UICheckboxButton * chkChecked;
    
    UICheckboxButton * chkOff;
    UICheckboxButton * chkOn;
    
    CustomSegmentedControl * segOptions;
    
    CustomPopView * pop1;
    CustomPopView * pop2;
}

- (void) setEnable:(BOOL)enable;

@end
