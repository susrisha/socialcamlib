//
//  SCAAppDelegate.m
//  SocialCamApi
//
//  Created by Naresh Devalapally on 19/09/12.
//  Copyright (c) 2012 Sukeerthi LLC Ltd. All rights reserved.
//

#import "SCAAppDelegate.h"

#import "SCAMasterViewController.h"

#import "SCADetailViewController.h"
#import "LoginViewController.h"
#import "SCAUtilities.h"

@implementation SCAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.detailViewManager = [[DetailViewManager alloc]init];
    SCAMasterViewController *masterViewController = [[SCAMasterViewController alloc] initWithNibName:@"SCAMasterViewController" bundle:nil];
    UINavigationController *masterNavigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];

    SCADetailViewController *detailViewController = [[SCADetailViewController alloc] initWithNibName:@"SCADetailViewController" bundle:nil];
    UINavigationController *detailNavigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];

    masterViewController.detailViewController = detailViewController;

    self.splitViewController = [[UISplitViewController alloc] init];
    self.splitViewController.delegate = detailViewController;
    self.splitViewController.viewControllers = @[masterNavigationController, detailNavigationController];
    self.window.rootViewController = self.splitViewController;
    masterViewController.mainSplitController = self.splitViewController;
    
    self.detailViewManager.splitViewController = self.splitViewController;
    self.detailViewManager.detailViewController = detailViewController;
    self.splitViewController.delegate = self.detailViewManager;
    if ([self.splitViewController respondsToSelector:@selector(setPresentsWithGesture:)])
        [self.splitViewController setPresentsWithGesture:YES];
    
    // Check and load the login url
    
    [self.window makeKeyAndVisible];
    if (![SCAUtilities isLoggedIn]) {
        NSLog(@"Not logged in. have to show login view.");
        LoginViewController *aLoginController = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
        aLoginController.modalPresentationStyle = UIModalPresentationFormSheet;
        [detailNavigationController presentModalViewController:aLoginController animated:YES];
    }
    else{
        // put up a logged in notification.
        [SCAUtilities notifyLoggedIn];
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
