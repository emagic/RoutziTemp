//
//  ElementViewController.m
//  Taxi
//
//  Created by Tapha Media Ltd on 9/6/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "ElementViewController.h"

@interface ElementViewController ()

@end

@implementation ElementViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self insertNavBarWithScreenName:SCREEN_ELEMENT];
    
    switchOff = [UICustomSwitch viewFromStoryboard];
    [switchOff setFrame:CGRectMake( 20, 80, 51, 31 )];
    [switchOff setOn:NO];
    [self.view addSubview:switchOff];
    
    switchOn = [UICustomSwitch viewFromStoryboard];
    [switchOn setFrame:CGRectMake( 90, 80, 51, 31 )];
    [switchOn setOn:YES];
    [self.view addSubview:switchOn];
    
    
    
    slider = [[UICustomSlider alloc] initWithFrame:CGRectMake( 15, 130, 250, 30 )];
    [slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    
    chkUnChecked = [[UICheckboxButton alloc] initWithFrame:CGRectMake( 15, 170, 22, 22 )];
    [chkUnChecked setText:@""];
    [chkUnChecked setCheckboxType:YES];
    [chkUnChecked setCheckBoxLeftType];
    [chkUnChecked setDelegate:self];
    [self.view addSubview:chkUnChecked];
    
    chkChecked = [[UICheckboxButton alloc] initWithFrame:CGRectMake( 50, 170, 22, 22 )];
    [chkChecked setText:@""];
    [chkChecked setCheckboxType:YES];
    [chkChecked setCheckBoxLeftType];
    [chkChecked setChecked:YES];
    [chkChecked setDelegate:self];
    [self.view addSubview:chkChecked];
    
    
    chkOff = [[UICheckboxButton alloc] initWithFrame:CGRectMake( 85, 170, 22, 22 )];
    [chkOff setText:@""];
    [chkOff setCheckboxType:NO];
    [chkOff setCheckBoxLeftType];
    [chkOff setDelegate:self];
    [self.view addSubview:chkOff];
    
    chkOn = [[UICheckboxButton alloc] initWithFrame:CGRectMake( 120, 170, 22, 22 )];
    [chkOn setText:@""];
    [chkOn setCheckboxType:NO];
    [chkOn setCheckBoxLeftType];
    [chkOn setChecked:YES];
    [chkOn setDelegate:self];
    [self.view addSubview:chkOn];
    
    
    segOptions = [[CustomSegmentedControl alloc] init];
    [segOptions setSegmentWithCount:3
                        segmentsize:CGSizeMake( 100, 29 )
                       dividerImage:nil
                                tag:9001
                           delegate:self];
    [segOptions setFrame:CGRectMake( 10, 240, 300, 29 )];
    [self.view addSubview:segOptions];
    
    
    // Pop View
    pop1 = (CustomPopView *)[[CustomPopView alloc] viewFromStoryboard];
    [pop1 setFrame:CGRectMake( 10, 350, 300, 45 )];
    pop1.delegate = self;
    [pop1 setPopView:[NSArray arrayWithObjects:@"Select", @"Select All", nil] xPos:230];
    [self.view addSubview:pop1];

    pop2 = (CustomPopView *)[[CustomPopView alloc] viewFromStoryboard];
    [pop2 setFrame:CGRectMake( 10, 400, 300, 45 )];
    pop2.delegate = self;
    [pop2 setPopView:[NSArray arrayWithObjects:@"Select", @"Select All", @"Paste",  nil] xPos:20];
    [self.view addSubview:pop2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setEnable:(BOOL)enable
{
    [self.view setUserInteractionEnabled:enable];
}


- (void) resize
{
    [super resize];
    
    int offset = 20;
    if (gIOSVersion == IOS_7) {
        CGRect frm = self.navBarView.frame;
        frm.size.height += offset;
        [self.navBarView setFrame:frm];
    }
}


- (void) sliderChanged:(id)sender
{
    ;
}


#pragma mark --
#pragma mark -- NavBar Delegate --

- (void) didClickNavBarLeftButton
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3f];
    [UIView setAnimationDelegate:self];
        
    CGRect frm = self.view.frame;
    if (frm.origin.x==0) {
        frm.origin.x = 253;
    }
    else{
        frm.origin.x = 0;
    }
    [self.view setFrame:frm];
    
    [UIView commitAnimations];
}


#pragma mark --
#pragma mark -- CustomSegmentedControlDelegate --

- (UIButton*) buttonFor:(CustomSegmentedControl*)segmentedControl atIndex:(NSUInteger)segmentIndex
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setFrame:CGRectMake( 0, 0, 100, 29 )];
    
    [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"search_seg_pay_%d.png", segmentIndex + 1]]
                   forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"search_seg_pay_%d_selected.png", segmentIndex + 1]]
                   forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor colorWithRed:1.0f green:225/255.0f blue:0.0f alpha:1.0f]
              forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:13.0f]];
    
    if (segmentIndex == 0) {
        [btn setTitle:@"Label One"
             forState:UIControlStateNormal];
        [btn setSelected:NO];
    }
    else if (segmentIndex == 1) {
        [btn setTitle:@"Label Two"
             forState:UIControlStateNormal];
        [btn setSelected:YES];
    }
    else {
        [btn setTitle:@"Label Three"
             forState:UIControlStateNormal];
        [btn setSelected:NO];
    }

    return btn;
}

- (void) touchUpInsideSegment:(CustomSegmentedControl *)segmentedControl index:(NSUInteger)segmentIndex
{
    ;
}



#pragma mark --
#pragma mark -- CustomPosViewDelegate --

- (void) didClickOptionOnPop:(CustomPopView *)cpv index:(int)index
{
    ;
}


- (void) didClickDetailOnPop:(CustomPopView *)cpv
{
    ;
}

@end
