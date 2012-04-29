//
//  TopPlacesTableViewController.h
//  TopPlaces
//
//  Created by Ashutosh Sanzgiri on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TopPlacesTableViewController;

@interface TopPlacesTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *topPlaces; 
@property (nonatomic, strong) NSDictionary *place;

@end
