//
//  FirstViewController.h
//  CoffeeMenu
//
//  Created by 黃昱彰 on 2014/6/8.
//  Copyright (c) 2014年 max005. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UICollectionViewDataSource>;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property  NSInteger selectedIndex;
@end
