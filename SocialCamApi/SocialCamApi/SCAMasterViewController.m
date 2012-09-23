//
//  SCAMasterViewController.m
//  SocialCamApi
//
//  Created by Naresh Devalapally on 19/09/12.
//  Copyright (c) 2012 Sukeerthi LLC Ltd. All rights reserved.
//

#import "SCAMasterViewController.h"

#import "SCADetailViewController.h"
#import "SCAUtilities.h"

@interface SCAMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation SCAMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Actions", @"Actions");
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    // This class will listen for the login and will reload accordingly.
  //  [NSNotificationCenter defaultCenter]addObserver:self selector:<#(SEL)#> name:<#(NSString *)#> object:<#(id)#>
    
	// Do any additional setup after loading the view, typically from a nib.
   // self.navigationItem.leftBarButtonItem = self.editButtonItem;
[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didFinishLoggingIn) name:SocialCamdidLoginNotification object:nil];
  //  UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    //self.navigationItem.rightBarButtonItem = addButton;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }


   // NSDate *object = [_objects objectAtIndex:indexPath.row];
    cell.textLabel.text = [_objects objectAtIndex:indexPath.row];//[object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

-(void)didFinishLoggingIn
{
    NSLog(@"Did finish login called..");
    //User *currentUser = [SCAUtilities getCurrentUser];
    NSString *action1 = [NSString stringWithFormat:@"users:id"];
    NSString *action2 = [NSString stringWithFormat:@"users/self"];
    NSString *action3 = [NSString stringWithFormat:@"users/id/videos"];
    NSString *action4 = [NSString stringWithFormat:@"users/self/feed"];
    NSString *action5 = [NSString stringWithFormat:@"users/self/likes"];
    NSString *action6 = [NSString stringWithFormat:@"users/:id/followers"];
    NSString *action7 = [NSString stringWithFormat:@"users/:id/following"];
    NSString *action8 = [NSString stringWithFormat:@"videos/id"];
    NSString *action9 = [NSString stringWithFormat:@"videos/id/comments"];
    NSString *action10 = [NSString stringWithFormat:@"videos/id/likes"];
    NSString *action11 = [NSString stringWithFormat:@"tags/tag-name"];
    NSString *action12 = [NSString stringWithFormat:@"tags/tag-name/videos"];
  
    
   // _objects = [[NSMutableArray  alloc ]initWithObjects:@"videos",@"me",@"friends",@"users",@"feed","likes", nil];
    _objects=[[NSMutableArray alloc]initWithObjects:action1,action2,action3,action4,action5,action6,action7,action8,action9,action10,action11,action12, nil];
    // have to reload the table..
    [self.tableView reloadData];
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDate *object = [_objects objectAtIndex:indexPath.row];
    self.detailViewController.detailItem = object;
}

@end
