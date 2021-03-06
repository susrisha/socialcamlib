//
//  SCAAppDelegate.h
//  SocialCamApi
//
//  Created by Naresh Devalapally on 19/09/12.
//  Copyright (c) 2012 Sukeerthi LLC Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewManager.h"

@interface SCAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UISplitViewController *splitViewController;
@property (nonatomic, retain) IBOutlet DetailViewManager *detailViewManager;


@end
