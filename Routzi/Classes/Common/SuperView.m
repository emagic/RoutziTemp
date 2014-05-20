//
//  SuperView.m
//  
//
//  Created by Tapha Media Ltd on 9/27/11.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "SuperView.h"


@implementation SuperView



- (SuperView *) viewFromStoryboard
{
    NSLog(@"%@", NSStringFromClass([self class]));
    
    return [SuperView viewFromStoryboard:NSStringFromClass([self class])];
}

+ (id)viewFromStoryboard:(NSString *)storyboardID
{
	UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController * controller = [storyBoard instantiateViewControllerWithIdentifier:storyboardID];
	
	SuperView * vw = (SuperView *)(controller.view);
	return vw;
}


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void) resize
{
    ;
}


@end
