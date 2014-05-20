//
//  ChatViewController.h
//  Taxi
//
//  Created by Tapha Media Ltd on 9/6/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "SuperViewController.h"
#import "HeaderView.h"

@interface ChatViewController : SuperViewController {
    IBOutlet UILabel * lblTitle;
    
    IBOutlet UITableView * tblDrivers;
    
    IBOutlet HeaderView *viewHeader;
    
    // Temporary Data
    NSMutableArray * arrUsers;
}

@end
