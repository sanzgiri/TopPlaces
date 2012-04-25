//
//  TopPlacesTableViewController.h
//  TopPlaces
//
//  Created by Ashutosh Sanzgiri on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TopPlacesTableViewController;

@protocol TopPlacesTableViewControllerDelegate 
@optional
- (void)topPlacesTableViewController:(TopPlacesTableViewController *)sender
                                 chosePlace:(NSDictionary *)place;
@end

@interface TopPlacesTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *topPlaces; 
@property (nonatomic, strong) NSDictionary *place;
@property (nonatomic, weak) id <TopPlacesTableViewControllerDelegate> delegate;

@end
