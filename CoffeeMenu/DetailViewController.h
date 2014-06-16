//
//  DetailViewController.h
//  CoreData2
//
//  Created by 黃昱彰 on 2014/6/16.
//  Copyright (c) 2014年 max005. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
