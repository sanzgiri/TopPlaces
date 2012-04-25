//
//  TopPlacesViewController.m
//  TopPlaces
//
//  Created by Ashutosh Sanzgiri on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TopPlacesViewController.h"
#import "FlickrFetcher.h"

@interface TopPlacesViewController ()

@end

#if 0
topPlaces Array of Dictionaries
{
    "_content" = "Carlsbad, California, United States";
    latitude = "33.165";
    longitude = "-117.338";
    "photo_count" = 57;
    "place_id" = XUDD26RTUb311HBV;
    "place_type" = locality;
    "place_type_id" = 7;
    "place_url" = "/United+States/California/Carlsbad";
    timezone = "America/Los_Angeles";
    woeid = 2375062;
},
photosInPlace Array of Dictionaries
{
accuracy = 16;
context = 0;
dateupload = 1335331235;
description =         {
    "_content" = "I wanna swim across, to get home";
};
farm = 6;
"geo_is_contact" = 0;
"geo_is_family" = 0;
"geo_is_friend" = 0;
"geo_is_public" = 1;
id = 6965726338;
isfamily = 0;
isfriend = 0;
ispublic = 1;
latitude = "37.780833";
longitude = "-122.513667";
owner = "69277249@N06";
ownername = irishoshi;
"place_id" = "KBdyTpxTUb_BZRuLTg";
secret = 6916a44eaf;
server = 5449;
tags = "sanfrancisco california pacificocean cliffhouse";
title = "IMG_1087";
woeid = 23512034;
},
    
NSArray *myTopPlaces = [FlickrFetcher topPlaces];
NSLog(@"%@", myTopPlaces); 
//    for (int i = 0; i < [myTopPlaces count]; i++)
for (int i = 0; i < 1; i++)    
{
    NSDictionary* myPlace = [myTopPlaces objectAtIndex:i];
    NSArray *myPhotos = [FlickrFetcher photosInPlace:myPlace maxResults:10];
    NSLog(@"%@", myPhotos);
}

#endif


@implementation TopPlacesViewController 

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
