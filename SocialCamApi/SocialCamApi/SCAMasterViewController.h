//
//  SCAMasterViewController.h
//  SocialCamApi
//
//  Created by Naresh Devalapally on 19/09/12.
//  Copyright (c) 2012 Sukeerthi LLC Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SCADetailViewController;

@interface SCAMasterViewController : UITableViewController

@property (strong, nonatomic) SCADetailViewController *detailViewController;
@property (strong,nonatomic) UISplitViewController *mainSplitController;

@end
