//
//  PhotosInPlaceViewController.m
//  TopPlaces
//
//  Created by Ashutosh Sanzgiri on 4/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhotosInPlaceViewController.h"
#import "FlickrFetcher.h"

@interface PhotosInPlaceViewController ()
@end

@implementation PhotosInPlaceViewController

@synthesize photosInPlace = _photosInPlace;
@synthesize curPlace = _curPlace;
@synthesize photo = _photo;

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DisplayPhotoForPlace"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        NSDictionary* photo = [self.photosInPlace objectAtIndex:indexPath.row];
        self.photo = photo;
        [segue.destinationViewController setPhoto:photo];

        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *favorites = [[defaults objectForKey:FAVORITES_KEY] mutableCopy];
        if (!favorites) favorites = [NSMutableArray array];
        
        int cur_photo_id = (int) [self.photo valueForKey:@"id"];
        BOOL add_photo = YES;
        for (int i = 0; i < [favorites count]; i++)
        {
            int photo_id = (int) [[favorites objectAtIndex:i] valueForKey:@"id"];
            if (cur_photo_id == photo_id)
            {
                add_photo = NO;
            }
        }
        
        if (add_photo == YES)
        {
            [favorites insertObject:self.photo atIndex:0];
            if ([favorites count] > MAX_RECENT_PHOTOS)
            {
                [favorites removeLastObject];
            }
        }
        [defaults setObject:favorites forKey:FAVORITES_KEY];
        [defaults synchronize]; 
    }
}

- (void) setPlace:(NSDictionary *)place
{
    self.curPlace = place;
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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.curPlace)
    {
        NSMutableArray *inPlacePhotos = [[NSMutableArray alloc] initWithArray:[FlickrFetcher photosInPlace:self.curPlace maxResults:50]];
        self.photosInPlace = inPlacePhotos;
    }
    
    NSString *placeName = [self.curPlace valueForKey:@"_content"];
    NSArray *placeNameArray = [placeName componentsSeparatedByString:@","];
    [self setTitle:[[placeNameArray objectAtIndex:0] stringByAppendingString:@" Photos"]];
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
    return MIN([self.photosInPlace count], 50);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PhotosInPlacePrototype";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSDictionary* photo = [self.photosInPlace  objectAtIndex:indexPath.row];

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
