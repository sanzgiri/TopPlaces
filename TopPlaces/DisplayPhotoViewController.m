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
@synthesize delegate = _delegate;
@synthesize webView = _webView;
@synthesize recentPhotos = _recentPhotos;

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
    NSLog(@"%@", photoURL);
    
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

    NSInteger id = [self.curPhoto valueForKey:@"id"];
    [self.recentPhotos  addObject:self.curPhoto];
    if ([self.recentPhotos count] > 20)
    {   
        [self.recentPhotos removeLastObject];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
#if 0
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
#endif
    return YES;
}

@end
