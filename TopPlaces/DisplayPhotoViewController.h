//
//  DisplayPhotoViewController.h
//  TopPlaces
//
//  Created by Ashutosh Sanzgiri on 4/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DisplayPhotoViewController;

@protocol DisplayPhotoViewControllerDelegate 
@optional
- (void)displayPhotoViewController:(DisplayPhotoViewController *)sender
                         chosePhotos:(NSMutableArray *)recentPhotosArray;
@end

@interface DisplayPhotoViewController : UIViewController

#define MAX_RECENT_PHOTOS 20
@property (nonatomic, strong) NSDictionary *curPhoto;
@property (nonatomic, strong) NSMutableArray *recentPhotos;
@property (nonatomic, weak) id <DisplayPhotoViewControllerDelegate> delegate;
- (void)setPhoto:(NSDictionary *)photo;
+ (NSArray *)getRecentPhotos;

@end
