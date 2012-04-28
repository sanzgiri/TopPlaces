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
                         chosePhoto:(id)photo;
@end

@interface DisplayPhotoViewController : UIViewController

@property (nonatomic, strong) NSDictionary *curPhoto;
@property (nonatomic, strong) NSMutableArray *recentPhotos;
@property (nonatomic, weak) id <DisplayPhotoViewControllerDelegate> delegate;
- (void)setPhoto:(NSDictionary *)photo;



@end
