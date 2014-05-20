//
//  MapPinInfView.h
//  Taxi
//
//  Created by Tapha Media Ltd on 9/6/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "SuperView.h"

@protocol MapPinInfViewDelegate;

@interface MapPinInfView : SuperView {
    IBOutlet UILabel * lblTime;
    IBOutlet UILabel * lblTaxi;
    
    IBOutlet UIButton * btnIndicator;
}
@property (nonatomic, assign) id<MapPinInfViewDelegate> delegate;

- (IBAction) indicator_click:(id)sender;

- (void) setPinInf:(int) minute taxi:(NSString *)taxiname;

- (void) show:(BOOL)show;
- (BOOL) isDisappeared;

@end


@protocol MapPinInfViewDelegate <NSObject>

- (void) willShowPinDetail:(MapPinInfView *)mpiv;

@end