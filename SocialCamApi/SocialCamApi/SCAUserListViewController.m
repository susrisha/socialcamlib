//
//  SCAUserListViewController.m
//  SocialCamApi
//
//  Created by Naresh Devalapally on 02/10/12.
//  Copyright (c) 2012 Sukeerthi LLC Ltd. All rights reserved.
//

#import "SCAUserListViewController.h"
#import "SocialCamEngine.h"
#import "NetworkImageView.h"
#import "User.h"
#import "LoadingIndicator.h"

@interface SCAUserListViewController ()
{
    NSArray *currentUserList;
}

@end

@implementation SCAUserListViewController

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
    self.title = [self.userlistPath lastPathComponent];
    // Do any additional setup after loading the view from its nib.
    self.graphPathLabel.text = self.userlistPath;
    [[LoadingIndicator currentIndicator]displayActivity:@"Loading.."];
    [[SocialCamEngine sharedEngine]userListforPath:self.userlistPath onCompletion:^(NSMutableArray *userObjects) {
        [[LoadingIndicator currentIndicator]hide];
        
        currentUserList = userObjects;
        [self.userListTable reloadData];
        
    } onError:^(NSError *error) {
        [[LoadingIndicator currentIndicator]hide];
        
    }];
}

#pragma mark - UITableView Details

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return currentUserList.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"UserCell";
    NetworkImageView *videoImage ;
    UILabel *nameLabel ;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        videoImage = [[NetworkImageView alloc]initWithFrame:CGRectMake(5, 5, 40, 40)];
        videoImage.tag = 456;
        nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(55, 5, 400, 40)];
        nameLabel.tag = 786;
        [cell.contentView addSubview:videoImage];
        [cell.contentView addSubview:nameLabel];
    }
    videoImage = (NetworkImageView*)[cell.contentView viewWithTag:456];
    nameLabel = (UILabel*)[cell.contentView viewWithTag:786];
    
    
    User *currentUser = [currentUserList objectAtIndex:indexPath.row];
    // NSDate *object = [_objects objectAtIndex:indexPath.row];
    //SocialCamVideo *currentVideo = [currentVideosArray objectAtIndex:indexPath.row];
    NSLog(@"picture 180 url %@",currentUser.picture);
    [videoImage setImageUrl:[NSURL URLWithString:currentUser.picture]];
    nameLabel.text = currentUser.name;//currentVideo.title;
    
    //cell.textLabel.text = currentVideo.title;//[currentVideosArray objectAtIndex:indexPath.row];//[object description];
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setGraphPathLabel:nil];
    [self setUserListTable:nil];
    [super viewDidUnload];
}
@end
