//
//  RecentsTableViewController.m
//  TopPlaces
//
//  Created by Ashutosh Sanzgiri on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RecentsTableViewController.h"
#import "DisplayPhotoViewController.h"
#import "PhotosInPlaceViewController.h"

@interface RecentsTableViewController () <PhotosInPlaceViewControllerDelegate>

@end

@implementation RecentsTableViewController

@synthesize recentPhotosToDisplay = _recentPhotosToDisplay;

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DisplayRecentPhoto"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *favorites = [[defaults objectForKey:FAVORITES_KEY] mutableCopy];
        NSDictionary* photo = [favorites objectAtIndex:indexPath.row];
        NSLog(@"prepared segue for %@", photo);
        [segue.destinationViewController setPhoto:photo];
//        [segue.destinationViewController setDelegate:self];
    }
}

#if 0
- (void)displayPhotoViewController:(DisplayPhotoViewController *)sender chosePhotos:(NSMutableArray *)recentPhotosArray;
{ 
    NSLog(@"recentPhotos = %@", recentPhotosArray);
    self.recentPhotosToDisplay = [recentPhotosArray copy];
}
#endif

- (void)photosInPlaceViewController:(PhotosInPlaceViewController *)sender
                         chosePhoto:(id)photo;
{
    NSLog(@"received photo = %@", photo);
}

- (void) setRecentPhotosToDisplay:(NSArray *)recentPhotosToDisplay
{
//    self.recentPhotosToDisplay = [DisplayPhotoViewController getRecentPhotos];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
#if 0
    if (self) {
        self.recentPhotosToDisplay = [[NSMutableArray alloc] initWithCapacity:MAX_RECENT_PHOTOS];
    }
#endif
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *favorites = [[defaults objectForKey:FAVORITES_KEY] mutableCopy];
//    self.recentPhotosToDisplay = [favorites mutableCopy];
//    NSLog(@"recentPhotosToDisplay %@", self.recentPhotosToDisplay);
    [self setTitle:@"Recent Photos"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return MAX_RECENT_PHOTOS;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RecentPhotosPrototype";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *favorites = [[defaults objectForKey:FAVORITES_KEY] mutableCopy];
    
    NSDictionary* photo = [favorites objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [photo valueForKeyPath:@"title"];
    if ([cell.textLabel.text isEqualToString:@""]) {
        cell.textLabel.text = [photo valueForKeyPath:@"description._content"];  
        if ([cell.textLabel.text isEqualToString:@""]) {
            cell.textLabel.text = @"Unknown";
        }   
        cell.detailTextLabel.text = @"";
    } 
    else {
        cell.detailTextLabel.text = [photo valueForKeyPath:@"description._content"];
    }
    
    return cell;    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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


@end
