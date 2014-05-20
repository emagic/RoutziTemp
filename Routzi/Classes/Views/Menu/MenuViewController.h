//
//  MenuViewController.h
//  Taxi
//
//  Created by Tapha Media Ltd on 9/5/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "SuperViewController.h"

@class HomeViewController;
@class ElementViewController;

@interface MenuViewController : SuperViewController {
    
    IBOutlet UIImageView * imgvwProfile;
    IBOutlet UILabel * lblProfile;
    
    IBOutlet UITableView * tblMenu;
    IBOutlet UIImageView * imgvwVBar;
    
    // Variable
    HomeViewController * homeController;
    ElementViewController * elementController;
}

@end
