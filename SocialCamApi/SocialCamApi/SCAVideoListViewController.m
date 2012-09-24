//
//  SCAVideoListViewController.m
//  SocialCamApi
//
//  Created by Naresh Devalapally on 23/09/12.
//  Copyright (c) 2012 Sukeerthi LLC Ltd. All rights reserved.
//

#import "SCAVideoListViewController.h"
#import "SocialCamVideo.h"
#import "NetworkImageView.h"
#import "SmallThumb.h"
#import "SocialCamEngine.h"
#import "LoadingIndicator.h"

@interface SCAVideoListViewController ()
{
    NSArray *currentVideosArray;
}

@end

@implementation SCAVideoListViewController

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
    // Do any additional setup after loading the view from its nib.
    [[SocialCamEngine sharedEngine]videosForPath:self.videosPath onCompletion:^(NSMutableArray *videoObjects) {
        
        currentVideosArray = videoObjects;
        //NSLog(@"loading images..");
        [[LoadingIndicator currentIndicator]hide];
        [videosTableView reloadData];
        //[self rearrangeForOrientation:[UIInterfac
        // SocialCamVideo *firtVideo = [currentPictures objectAtIndex:0];
        // NSLog(@"current Pictures %@",currentPictures);
        //NSLog(@"First video url %@",firtVideo.title);
    } onError:^(NSError *error) {
        NSLog(@"Error occured..");
        [[LoadingIndicator currentIndicator]hide];
    } ];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return currentVideosArray.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    NetworkImageView *videoImage ;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        videoImage = [[NetworkImageView alloc]initWithFrame:CGRectMake(5, 5, 40, 40)];
        videoImage.tag = 456;
        [cell.contentView addSubview:videoImage];
    }
    videoImage = (NetworkImageView*)[cell.contentView viewWithTag:456];
    
    
    // NSDate *object = [_objects objectAtIndex:indexPath.row];
    SocialCamVideo *currentVideo = [currentVideosArray objectAtIndex:indexPath.row];
    [videoImage setImageUrl:[NSURL URLWithString:currentVideo.small_thumb.url]];
    cell.textLabel.text = currentVideo.title;//[currentVideosArray objectAtIndex:indexPath.row];//[object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    videosTableView = nil;
    [super viewDidUnload];
}
@end
