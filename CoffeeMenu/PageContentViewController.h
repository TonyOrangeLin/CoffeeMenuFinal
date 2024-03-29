//
//  PageContentViewController.h
//  PageViewDemo
//
//  Created by Simon on 24/11/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "FirstViewController.h"

@interface PageContentViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, NSFetchedResultsControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIButton *IntoFBButton;
@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;
@property BOOL isfbEnable;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@end
