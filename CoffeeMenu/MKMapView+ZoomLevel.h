//
//  MKMapView+ZoomLevel.h
//  CoffeeMenu
//
//  Created by tony on 2014/6/14.
//  Copyright (c) 2014年 max005. All rights reserved.
//

#import <MapKit/MapKit.h>
//#import <MapKit/MapKit.h>
@interface MKMapView (ZoomLevel)
- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate
                  zoomLevel:(NSUInteger)zoomLevel
                   animated:(BOOL)animated;
@end
