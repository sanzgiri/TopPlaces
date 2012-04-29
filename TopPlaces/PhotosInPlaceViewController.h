//
//  PhotosInPlaceViewController.h
//  TopPlaces
//
//  Created by Ashutosh Sanzgiri on 4/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PhotosInPlaceViewController;

@interface PhotosInPlaceViewController : UITableViewController

@property (nonatomic, strong) NSArray *photosInPlace; 
@property (nonatomic, strong) NSDictionary *curPlace;
@property (nonatomic, strong) NSDictionary *photo;

- (void)setPlace:(NSDictionary *)place;

#define FAVORITES_KEY @"DisplayPhotoViewController.Favorites"
#define PHOTOS_TO_DISPLAY 50
#define MAX_RECENT_PHOTOS 20

@end
