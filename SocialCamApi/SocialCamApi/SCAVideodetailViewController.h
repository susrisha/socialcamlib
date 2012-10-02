//
//  SCAVideodetailViewController.h
//  SocialCamApi
//
//  Created by Naresh Devalapally on 02/10/12.
//  Copyright (c) 2012 Sukeerthi LLC Ltd. All rights reserved.
//

#import "SCADetailViewController.h"

@interface SCAVideodetailViewController : SCADetailViewController{
    
    __weak IBOutlet UILabel *ownerLabel;
    __weak IBOutlet UILabel *videoUrlLabel;
    __weak IBOutlet UILabel *commentsLabel;
    __weak IBOutlet UIWebView *videoWebView;
    __weak IBOutlet UILabel *videoNameLabel;
    __weak IBOutlet UILabel *likesLabel;
}

@property (nonatomic,strong)NSString *videoId;
@end
