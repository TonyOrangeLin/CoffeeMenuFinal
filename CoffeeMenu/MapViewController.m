//
//  MapViewController.m
//  CoffeeMenu
//
//  Created by tony on 2014/6/10.
//  Copyright (c) 2014年 max005. All rights reserved.
//

#import "MapViewController.h"
#import "MKMapView+ZoomLevel.h"
#define ZOOM_LEVEL 1000
@interface MapViewController ()<UISearchDisplayDelegate, UISearchBarDelegate>

@end

@implementation MapViewController{
    MKLocalSearch *localSearch;
    MKLocalSearchResponse *results;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.searchDisplayController setDelegate:self];
    //[self.ibSearchBar setDelegate:self];
    
    // Zoom the map to current location.
    [self.ibMapView setShowsUserLocation:YES];
    [self.ibMapView setUserInteractionEnabled:YES];
    [self.ibMapView setUserTrackingMode:MKUserTrackingModeFollow];
    //[self.ibMapView setUserTrackingMode:MKUserTrackingModeFollowWithHeading];
    // [self.ibMapView setCenterCoordinate:item.placemark.location.coordinate animated:NO];
    // Cancel any previous searches.
    CLLocationCoordinate2D startCoord = [self.ibMapView centerCoordinate];
    MKCoordinateRegion adjustedRegion = [self.ibMapView regionThatFits:MKCoordinateRegionMakeWithDistance(startCoord, 800, 800)];
  // MKCoordinateRegion adjustedRegion;
    adjustedRegion.span.longitudeDelta  = 0.000000000000002;
   adjustedRegion.span.latitudeDelta  = 0.0000000000000002;
    [self.ibMapView setRegion:adjustedRegion animated:NO];
     //   for(int count=0;count<100000;count++);
    //CLLocationCoordinate2D centre = [self.ibMapView centerCoordinate];
   // [self.ibMapView setCenterCoordinate:centre zoomLevel:1000 animated:NO];
    
    /*
    
    [localSearch cancel];
    
    // Perform a new search.
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = @"咖啡";
    request.region = self.ibMapView.region;
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error){
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        if (error != nil) {
            [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Map Error",nil)
                                        message:[error localizedDescription]
                                       delegate:nil
                              cancelButtonTitle:NSLocalizedString(@"OK",nil) otherButtonTitles:nil] show];
            return;
        }
        
        if ([response.mapItems count] == 0) {
            [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"No Results",nil)
                                        message:nil
                                       delegate:nil
                              cancelButtonTitle:NSLocalizedString(@"OK",nil) otherButtonTitles:nil] show];
            return;
        }
        
        results = response;
        
        for ( int count = 0 ;count < [response.mapItems count];count++)
        {
            [self.searchDisplayController setActive:NO animated:YES];
            MKMapItem *item = results.mapItems[count];
            [self.ibMapView addAnnotation:item.placemark];
            [self.ibMapView selectAnnotation:item.placemark animated:YES];
            
            [self.ibMapView setCenterCoordinate:item.placemark.location.coordinate animated:YES];
           // [self.ibMapView setCenterCoordinate:item.placemark.name animated:YES];
            [self.ibMapView setUserTrackingMode:MKUserTrackingModeNone];
            
            
        }
        //[self.searchDisplayController.searchResultsTableView reloadData];
    }];
     */


}
- (IBAction)mapButton:(id)sender {
    [localSearch cancel];
    
    // Perform a new search.
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = @"咖啡";
    request.region = self.ibMapView.region;
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error){
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        if (error != nil) {
            [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Map Error",nil)
                                        message:[error localizedDescription]
                                       delegate:nil
                              cancelButtonTitle:NSLocalizedString(@"OK",nil) otherButtonTitles:nil] show];
            return;
        }
        
        if ([response.mapItems count] == 0) {
            [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"No Results",nil)
                                        message:nil
                                       delegate:nil
                              cancelButtonTitle:NSLocalizedString(@"OK",nil) otherButtonTitles:nil] show];
            return;
        }
        
        results = response;
        
        for ( int count = 0 ;count < [response.mapItems count];count++)
        {
            //[self.searchDisplayController setActive:NO animated:YES];
            MKMapItem *item = results.mapItems[count];
            MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
            annotation.coordinate = item.placemark.coordinate;
            annotation.title=item.name;
            annotation.subtitle = item.placemark.title;
          
            //[self.ibMapView addAnnotation:item.name];
            [self.ibMapView addAnnotation:annotation];
            //[self.ibMapView selectAnnotation:item.placemark animated:YES];
            
            //[self.ibMapView setCenterCoordinate:item.placemark.location.coordinate animated:YES];
            
            [self.ibMapView setUserTrackingMode:MKUserTrackingModeNone];
            
            
        }
        //[self.searchDisplayController.searchResultsTableView reloadData];
    }];

}

#pragma mark - Search Methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    // Cancel any previous searches.
    [localSearch cancel];
    
    // Perform a new search.
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = @"咖啡";
    request.region = self.ibMapView.region;
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error){
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        if (error != nil) {
            [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Map Error",nil)
                                        message:[error localizedDescription]
                                       delegate:nil
                              cancelButtonTitle:NSLocalizedString(@"OK",nil) otherButtonTitles:nil] show];
            return;
        }
        
        if ([response.mapItems count] == 0) {
            [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"No Results",nil)
                                        message:nil
                                       delegate:nil
                              cancelButtonTitle:NSLocalizedString(@"OK",nil) otherButtonTitles:nil] show];
            return;
        }
        
        results = response;
        
        for ( int count = 0 ;count < [response.mapItems count];count++)
        {
            [self.searchDisplayController setActive:NO animated:YES];
            MKMapItem *item = results.mapItems[count];
            [self.ibMapView addAnnotation:item.placemark];
            [self.ibMapView selectAnnotation:item.placemark animated:YES];
            
            [self.ibMapView setCenterCoordinate:item.placemark.location.coordinate animated:YES];
            //[self.ibMapView addAnnotations:results];
            [self.ibMapView setUserTrackingMode:MKUserTrackingModeNone];

            
        }
        //[self.searchDisplayController.searchResultsTableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [results.mapItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *IDENTIFIER = @"SearchResultsCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IDENTIFIER];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:IDENTIFIER];
    }
    
    MKMapItem *item = results.mapItems[indexPath.row];
    
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.placemark.addressDictionary[@"Street"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.searchDisplayController setActive:NO animated:YES];
    
    MKMapItem *item = results.mapItems[indexPath.row];
    [self.ibMapView addAnnotation:item.placemark];
    [self.ibMapView selectAnnotation:item.placemark animated:YES];
    
    [self.ibMapView setCenterCoordinate:item.placemark.location.coordinate animated:YES];
    
    [self.ibMapView setUserTrackingMode:MKUserTrackingModeNone];
    
}

@end
