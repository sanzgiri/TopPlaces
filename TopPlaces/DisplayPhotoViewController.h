//
//  DisplayPhotoViewController.h
//  TopPlaces
//
//  Created by Ashutosh Sanzgiri on 4/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DisplayPhotoViewController;

@interface DisplayPhotoViewController : UIViewController

#define MAX_RECENT_PHOTOS 20
@property (nonatomic, strong) NSDictionary *curPhoto;
- (void)setPhoto:(NSDictionary *)photo;

@end
