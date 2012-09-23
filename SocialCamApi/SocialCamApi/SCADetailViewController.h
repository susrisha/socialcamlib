//
//  SCADetailViewController.h
//  SocialCamApi
//
//  Created by Naresh Devalapally on 19/09/12.
//  Copyright (c) 2012 Sukeerthi LLC Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewManager.h"
@interface SCADetailViewController : UIViewController <UISplitViewControllerDelegate,SubstitutableDetailViewController>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (nonatomic, retain) UIBarButtonItem *navigationPaneBarButtonItem;
@end
