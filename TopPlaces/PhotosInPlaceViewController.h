//
//  PhotosInPlaceViewController.h
//  TopPlaces
//
//  Created by Ashutosh Sanzgiri on 4/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PhotosInPlaceViewController;

@protocol PhotosInPlaceViewControllerDelegate 
@optional
- (void)photosInPlaceViewController:(PhotosInPlaceViewController *)sender
                          chosePhoto:(id)photo;
@end

@interface PhotosInPlaceViewController : UITableViewController

@property (nonatomic, strong) NSArray *photosInPlace; 
@property (nonatomic, strong) NSDictionary *curPlace;
@property (nonatomic, strong) NSDictionary *photo;
@property (nonatomic, weak) id <PhotosInPlaceViewControllerDelegate> delegate;
- (void)setPlace:(NSDictionary *)place;

@end
