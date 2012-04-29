//
//  TopPlacesTableViewController.m
//  TopPlaces
//
//  Created by Ashutosh Sanzgiri on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TopPlacesTableViewController.h"
#import "FlickrFetcher.h"

@interface TopPlacesTableViewController ()

@end

@implementation TopPlacesTableViewController

@synthesize topPlaces = _topPlaces;
@synthesize place = _place;

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowPhotosForPlace"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        NSDictionary* place = [self.topPlaces  objectAtIndex:indexPath.row];
        [segue.destinationViewController setPlace:place];
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Code to sort array of dictionaries using key "_content"
    NSMutableArray* ffTopPlaces = [[FlickrFetcher topPlaces] mutableCopy];    
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"_content"  ascending:YES];
    [ffTopPlaces sortUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
    self.topPlaces = [ffTopPlaces copy];
    [self setTitle:@"Top Places"];
    
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
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.topPlaces count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TopPlacesPrototype";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSDictionary* place = [self.topPlaces  objectAtIndex:indexPath.row];
    NSString *placeName = [place valueForKey:@"_content"];
    NSArray *placeNameArray = [placeName componentsSeparatedByString:@","];
    cell.textLabel.text = [placeNameArray objectAtIndex:0];

    if ([placeNameArray count] > 2)
    {
        cell.detailTextLabel.text = [[[placeNameArray objectAtIndex:1] stringByAppendingString:@", "]stringByAppendingFormat:[placeNameArray objectAtIndex:2]]; 
    } else {
           cell.detailTextLabel.text = [placeNameArray objectAtIndex:1];
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
