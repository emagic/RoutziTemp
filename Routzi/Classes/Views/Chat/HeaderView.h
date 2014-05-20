//
//  HeaderView.h
//  Taxi
//
//  Created by Tapha Media Ltd on 9/6/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "SuperView.h"

@interface HeaderView : SuperView {
    IBOutlet UILabel * lblTitle;
    IBOutlet UILabel * lblSW;
    IBOutlet UILabel * lblCount;
}

- (void) setHeaderView:(NSString *)title sw:(NSString *)sw count:(int)count;

@end
