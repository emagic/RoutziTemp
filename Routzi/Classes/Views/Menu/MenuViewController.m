//
//  MenuViewController.m
//  Taxi
//
//  Created by Tapha Media Ltd on 9/5/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuCell.h"

#import "HomeViewController.h"
#import "ElementViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

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
    
    imgvwProfile.layer.cornerRadius = 44 / 2;
    imgvwProfile.layer.masksToBounds = YES;
    imgvwProfile.layer.borderWidth = 1;
    imgvwProfile.layer.borderColor = [UIColor clearColor].CGColor;
    
    
    elementController = (ElementViewController *)[[ElementViewController alloc] viewFromStoryboard];
    [elementController setEnable:NO];
    CGRect frm = elementController.view.frame;
    frm.origin.x = 253;
    [elementController.view setFrame:frm];
    [self.view addSubview:elementController.view];
    
    homeController = (HomeViewController *)[[HomeViewController alloc] viewFromStoryboard];
    [homeController setEnable:YES];
    [self.view addSubview:homeController.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) resize
{
    int offset = 20;
    if (gIOSVersion == IOS_7) {
        CGRect frm = imgvwProfile.frame;
        frm.origin.y += offset;
        [imgvwProfile setFrame:frm];
        
        frm = lblProfile.frame;
        frm.origin.y += offset;
        [lblProfile setFrame:frm];
        
        frm = tblMenu.frame;
        frm.origin.y += offset;
        frm.size.height -= offset;
        [tblMenu setFrame:frm];
    }
}



#pragma mark --
#pragma mark -- UITableViewDelegate Method --
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	int cellRow = [indexPath row];
    
	MenuCell * cell = nil;
    
    NSString *cellid = @"MenuCell";
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if (cell == nil) {
        cell = [[MenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    [cell setCellContentWith:cellRow];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int cellRow = indexPath.row;
    
    if (cellRow == 0) {
        [self.view bringSubviewToFront:homeController.view];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3f];
        [UIView setAnimationDelegate:self];
        
        [homeController setEnable:YES];
        CGRect frm = homeController.view.frame;
        frm.origin.x = 0;
        [homeController.view setFrame:frm];
        [UIView commitAnimations];
    }
    else if (cellRow == 5) {
        [self.view bringSubviewToFront:elementController.view];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3f];
        [UIView setAnimationDelegate:self];
        
        [elementController setEnable:YES];
        CGRect frm = elementController.view.frame;
        frm.origin.x = 0;
        [elementController.view setFrame:frm];
        [UIView commitAnimations];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
