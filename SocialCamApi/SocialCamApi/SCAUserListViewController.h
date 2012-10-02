//
//  SCAUserListViewController.h
//  SocialCamApi
//
//  Created by Naresh Devalapally on 02/10/12.
//  Copyright (c) 2012 Sukeerthi LLC Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCADetailViewController.h"

@interface SCAUserListViewController : SCADetailViewController
{
    
}
@property (weak, nonatomic) IBOutlet UILabel *graphPathLabel;
@property (weak, nonatomic) IBOutlet UITableView *userListTable;
@property (nonatomic,strong)NSString *userlistPath;

@end
