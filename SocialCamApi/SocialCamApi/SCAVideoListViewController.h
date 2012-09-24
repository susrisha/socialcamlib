//
//  SCAVideoListViewController.h
//  SocialCamApi
//
//  Created by Naresh Devalapally on 23/09/12.
//  Copyright (c) 2012 Sukeerthi LLC Ltd. All rights reserved.
//

#import "SCADetailViewController.h"

@interface SCAVideoListViewController : SCADetailViewController{
    
    __weak IBOutlet UITableView *videosTableView;
}


@property(nonatomic,retain)NSString *videosPath;

@end
