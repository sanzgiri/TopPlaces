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

static NSMutableArray* recentPhotosArray;

- (NSMutableArray *)recentPhotos
{
    if (_recentPhotos == nil) {
        _recentPhotos = [[NSMutableArray alloc] init];
    }
    return _recentPhotos;
}

- (void) setPhoto:(NSDictionary *)photo
{
    self.curPhoto = photo;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        if (recentPhotosArray == nil)
        {
            recentPhotosArray = [[NSMutableArray alloc] init];
        }
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

    id curPhoto_id = [self.curPhoto valueForKey:@"id"];
    NSLog(@"curphotoid = %d", (int)curPhoto_id);
    
    if (recentPhotosArray == nil)
    {
        recentPhotosArray = [[NSMutableArray alloc] init];
    }
    int count = [recentPhotosArray count];
    
    if (count < 20)
    {
        [recentPhotosArray insertObject:self.curPhoto atIndex:count];
        NSLog(@"added first photo!");
        NSLog(@"count = %d", count);
 //       NSLog(@"recentPhotos = %@", recentPhotosArray);
    }    
    
    if (recentPhotosArray != nil)
    {
        NSLog(@"Delegating photos array");
        [self.delegate displayPhotoViewController:self chosePhotos:recentPhotosArray];
    }
    
#if 0
    id curPhoto_id = [self.curPhoto valueForKey:@"id"];
    NSLog(@"curphotoid = %d", (int)curPhoto_id);
    
    int count = [self.recentPhotos count];
        
    if (count < 20)
    {
        [self.recentPhotos insertObject:curPhoto_id atIndex:count];
        NSLog(@"added first photo!");
        NSLog(@"count = %d", count);
    }    
    
    for (int i = 0; i < [self.recentPhotos count]; i++) {
        id photo_id = [[self.recentPhotos objectAtIndex:i] valueForKey:@"id"];
        if (curPhoto_id != photo_id)
        {
           [self.recentPhotos  addObject:self.curPhoto];  
            NSLog(@"Added photo %d to array", (int) curPhoto_id);
        }
    }
    
    if ([self.recentPhotos count] > 20)
    {   
        [self.recentPhotos removeLastObject];
    }

    if (recentPhotosArray == nil)
    {
     recentPhotosArray = [[NSArray alloc] init];
    }
    
    recentPhotosArray = [self.recentPhotos copy];
//    NSLog(@"%@", recentPhotosArray);
#endif
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

+ (NSArray *)getRecentPhotos
{
    return recentPhotosArray;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
#if 0
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
#endif
    return YES;
}

@end
