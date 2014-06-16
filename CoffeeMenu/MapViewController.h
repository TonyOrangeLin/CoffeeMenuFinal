//
//  MapViewController.h
//  CoffeeMenu
//
//  Created by tony on 2014/6/10.
//  Copyright (c) 2014年 max005. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface MapViewController : UIViewController
@property (strong, nonatomic) IBOutlet UISearchBar *ibSearchBar;

@property (strong, nonatomic) IBOutlet MKMapView *ibMapView;
@end
