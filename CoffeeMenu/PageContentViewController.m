//
//  PageContentViewController.m
//  PageViewDemo
//
//  Created by Simon on 24/11/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "PageContentViewController.h"
#import <FacebookSDK/FacebookSDK.h>


@interface PageContentViewController ()

@end

#define I_HAVE_BREWED_A_CUP_OF NSLocalizedStringFromTable(@"I_HAVE_BREWED_A_CUP_OF", @"PageContentViewController",@"fbupload");
#define WITH_COFFEEMENU NSLocalizedStringFromTable(@"WITH_COFFEEMENU", @"PageContentViewController", @"app name");

@implementation PageContentViewController
- (void)setbackgroundcolor
{
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"Style_Enabled"])
    {
        
        self.view.backgroundColor = [UIColor brownColor];
        
            UIPageControl *pageControl = [UIPageControl appearance];
            pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
            pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
            pageControl.backgroundColor = [UIColor brownColor];
       
            
        
       
        //self.collectionView.backgroundColor = [UIColor blackColor];
    }
    else
    {
        
        self.view.backgroundColor = [UIColor whiteColor];
        UIPageControl *pageControl = [UIPageControl appearance];
        pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        pageControl.backgroundColor = [UIColor whiteColor];
        //self.collectionView.backgroundColor = [UIColor whiteColor];
    }
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

    self.backgroundImageView.image = [UIImage imageNamed:self.imageFile];
    self.titleLabel.text = self.titleText;
    self.IntoFBButton.enabled = self.isfbEnable;
    self.IntoFBButton.hidden=!(self.isfbEnable);
    [[NSNotificationCenter defaultCenter] addObserverForName:NSUserDefaultsDidChangeNotification object:nil queue:nil usingBlock:^(NSNotification *note){
        [self setbackgroundcolor];
    }];
     [self setbackgroundcolor];
   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareOGStoryWithShareDialog:(id)sender
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
    }else{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [imagePicker setDelegate:self];
    [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *img = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    /*
    FBPhotoParams *params = [[FBPhotoParams alloc] init];
    params.photos = @[img];
    
    
     [FBDialogs presentShareDialogWithPhotoParams:params
                                     clientState:nil
                                         handler:^(FBAppCall *call, NSDictionary *results, NSError *error) {
                                             if (error) {
                                                 NSLog(@"Error: %@", error.description);
                                             } else {
                                                 NSLog(@"Success!");
                                             }
                                             [self dismissViewControllerAnimated:YES completion:NULL];
                                         }];
     */
    NSString *coffee2 =[self.imageFile substringToIndex:(self.imageFile.length - 4)];
    NSString *coffee = [[NSBundle mainBundle] localizedStringForKey:coffee2 value:coffee2 table:@"coffeefb"];
    //NSString *text = [NSString stringWithFormat:@"I have brewed a cup of %@ with CoffeeMenu" , coffee];
    NSString *head = I_HAVE_BREWED_A_CUP_OF;
    NSString *tail = WITH_COFFEEMENU;
    NSString *text = [NSString stringWithFormat:@"%@ %@ %@" , head , coffee , tail];
    //NSString *text = [NSString stringWithFormat: I_HAVE_BREWED_A_CUP_OF+ @"%@" +  with [WITH_COFFEEMENU , coffee];

    [FBDialogs presentOSIntegratedShareDialogModallyFrom:picker
                                             initialText:text
                                               image:img
                                                 url:nil
                                                 handler:
                                                    ^(FBOSIntegratedShareDialogResult result, NSError *error) {
                                                     
                                                     //  while complete, do this
                                                        [self dismissViewControllerAnimated:YES completion:NULL];
                                                     switch (result) {
                                                             
                                                         case FBOSIntegratedShareDialogResultSucceeded:
                                                             
                                                             NSLog(@"Share Success.");
                                                             
                                                             break;
                                                             
                                                         case FBOSIntegratedShareDialogResultCancelled:
                                                             
                                                             NSLog(@"Share Cancelled.");
                                                             
                                                             break;
                                                             
                                                         case FBOSIntegratedShareDialogResultError:
                                                             
                                                             NSLog(@"Share Error.");
                                                             
                                                             break;
                                                             
                                                     }
                                                     NSLog(@"Share error : %@", error?error:@"OK");
                                                 }];
}


@end
