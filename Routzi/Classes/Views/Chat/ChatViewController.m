//
//  ChatViewController.m
//  Taxi
//
//  Created by Tapha Media Ltd on 9/6/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatCell.h"

@interface ChatViewController ()

@end

@implementation ChatViewController

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
    
    arrUsers = [[NSMutableArray alloc] init];
    
    TaxiData * item1 = [[TaxiData alloc] init];
    item1.strPhoto = @"photo1";
    item1.strTitle = @"Taxi 00689";
    item1.strDesc  = @"touches to chat";
    item1.strPhone = @"+44 1231231234";
    item1.online = YES;
    [arrUsers addObject:item1];
    
    TaxiData * item2 = [[TaxiData alloc] init];
    item2.strPhoto = @"photo2";
    item2.strTitle = @"Taxi 00126";
    item2.strDesc  = @"unavailable for chat";
    item2.strPhone = @"+44 9879879876";
    item2.online = NO;
    [arrUsers addObject:item2];
    
    TaxiData * item3 = [[TaxiData alloc] init];
    item3.strPhoto = @"photo3";
    item3.strTitle = @"Taxi 01087";
    item3.strDesc  = @"unavailable for chat";
    item3.strPhone = @"+44 3453453456";
    item3.online = NO;
    [arrUsers addObject:item3];
    
    TaxiData * item4 = [[TaxiData alloc] init];
    item4.strPhoto = @"photo4";
    item4.strTitle = @"Taxi 02098";
    item4.strDesc  = @"touches to chat";
    item4.strPhone = @"+44 43455654";
    item4.online = YES;
    [arrUsers addObject:item4];
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
        CGRect frm = lblTitle.frame;
        frm.origin.y += offset;
        [lblTitle setFrame:frm];
        
        frm = tblDrivers.frame;
        frm.origin.y += offset;
        frm.size.height -= offset;
        [tblDrivers setFrame:frm];
    }
}



#pragma mark --
#pragma mark -- UITableViewDelegate Method --

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    int count = 0;
    
    for (int i = 0; i < [arrUsers count]; i++ ) {
        TaxiData * item = [arrUsers objectAtIndex:i];
        if (item.online) {
            count ++;
        }
    }
    [viewHeader setHeaderView:@"Online in" sw:@"SW9" count:count];
    
    return viewHeader;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [arrUsers count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	int cellRow = [indexPath row];
    
	ChatCell * cell = nil;
    
    NSString *cellid = @"ChatCell";
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if (cell == nil) {
        cell = [[ChatCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    
    TaxiData * item = [arrUsers objectAtIndex:cellRow];
    [cell setChatCell:item];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int cellRow = indexPath.row;
    
    if (cellRow == 0) {
        ;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
