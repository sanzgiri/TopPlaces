//
//  DisplayPhotoViewController.m
//  TopPlaces
//
//  Created by Ashutosh Sanzgiri on 4/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DisplayPhotoViewController.h"
#import "FlickrFetcher.h"

@interface DisplayPhotoViewController ()
@property (nonatomic, weak) IBOutlet UIWebView *webView;
@end

@implementation DisplayPhotoViewController
@synthesize curPhoto = _curPhoto;
@synthesize webView = _webView;

- (void) setPhoto:(NSDictionary *)photo
{
    self.curPhoto = photo;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSURL *photoURL = [FlickrFetcher urlForPhoto:self.curPhoto format:FlickrPhotoFormatLarge];
    
    self.webView.scalesPageToFit = YES;
    [self.webView loadRequest:[NSURLRequest requestWithURL:photoURL]];
    
    NSString* viewTitle = [self.curPhoto valueForKeyPath:@"title"];
    if ([viewTitle isEqualToString:@""]) {
        viewTitle = [self.curPhoto valueForKeyPath:@"description._content"];  
        if ([viewTitle isEqualToString:@""]) {
            viewTitle = @"Unknown";
        }   
    }
    [self setTitle:viewTitle];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
}

@end
