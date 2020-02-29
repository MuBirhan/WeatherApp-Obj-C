//
//  NewLocationViewController.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 21/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "NewLocationViewController.h"
#import "UIColor+CustomColors.h"
#import "WeatherRepository.h"
@import MapKit;


@interface NewLocationViewController ()

@end

@implementation NewLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAddButton];
    [self setupInput];
    [self setupBlueButton];
    [self setupModalView];
    
    UIPanGestureRecognizer* panRec = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didDragMap:)];
    [panRec setDelegate:self];
    [self.mapView addGestureRecognizer:panRec];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(void) setupAddButton {
    self.addbutton.backgroundColor = [UIColor greenButton];
    self.addbutton.layer.cornerRadius = 25;
    self.addbutton.layer.shadowColor = [[UIColor greenShadow] CGColor];
    self.addbutton.layer.shadowOpacity = 1.0f;
    self.addbutton.layer.shadowOffset = CGSizeZero;
    self.addbutton.layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:self.addbutton.bounds cornerRadius:self.addbutton.layer.cornerRadius] CGPath];
    self.addbutton.layer.rasterizationScale = UIScreen.mainScreen.scale;
}

-(void) setupBlueButton {
    self.useMyLocationButton.backgroundColor = [UIColor blueButton];
    self.useMyLocationButton.layer.cornerRadius = 25;
    self.useMyLocationButton.layer.shadowColor = [[UIColor blueShadow] CGColor];
    self.useMyLocationButton.layer.shadowOpacity = 1.0f;
    self.useMyLocationButton.layer.shadowOffset = CGSizeZero;
    self.useMyLocationButton.layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:self.useMyLocationButton.bounds cornerRadius:self.useMyLocationButton.layer.cornerRadius] CGPath];
    self.useMyLocationButton.layer.rasterizationScale = UIScreen.mainScreen.scale;
}

-(void) setupModalView {
    self.modalView.layer.cornerRadius = 15;
    self.modalView.layer.shadowColor = [[UIColor greyShadow] CGColor];
    self.modalView.layer.shadowOpacity = 1.0f;
    self.modalView.layer.shadowOffset = CGSizeZero;
    self.modalView.layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:self.modalView.bounds
                                                                  cornerRadius:self.modalView.layer.cornerRadius] CGPath];
    self.modalView.layer.rasterizationScale = UIScreen.mainScreen.scale;
}

-(void) setupInput {
    self.locationNameInput.layer.borderWidth = 0.5;
    self.locationNameInput.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.locationNameInput.layer.masksToBounds = YES;
    self.locationNameInput.layer.cornerRadius = 25;
}

- (IBAction)centerToCurrentLocation:(id)sender {
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.coordinate, 1000, 1000);
    [self.mapView setRegion:region animated:YES];
}

- (IBAction)addLocation:(id)sender {
    CLLocationCoordinate2D location = [self.mapView convertPoint:CGPointMake(self.mapPointer.frame.size.width/2, self.mapPointer.frame.size.height/2) toCoordinateFromView:self.mapPointer];
    [self showLoading];
    [[WeatherRepository new] fetchWeatherWithLat:location.latitude lon:location.longitude andName:self.locationNameInput.text success:^(BOOL success) {
        [self hideLoading];
        NSLog(@"success");
    } error:^(NSString * _Nullable error) {
        [self hideLoading];
        [self showError:error];
    }];
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) showLocation {
    CLLocationCoordinate2D location = [self.mapView convertPoint:CGPointMake(self.mapPointer.frame.size.width/2, self.mapPointer.frame.size.height/2) toCoordinateFromView:self.mapPointer];
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:location.latitude longitude:location.longitude];
    CLGeocoder *geo = [[CLGeocoder alloc] init];
    [geo reverseGeocodeLocation:loc completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        if (placemark) {
            NSString *name = @"";
            NSString *locality = @"";
            NSString *country = @"";

            if (placemark.name) {
                name = [NSString stringWithFormat:@"%@, ", placemark.name];
            }
            if (placemark.locality) {
                locality = [NSString stringWithFormat:@"%@, ", placemark.locality];
            }
            if (placemark.country) {
                country = placemark.country;
            }
            self.locationInfo.text = [NSString stringWithFormat:@"%@%@%@", name, locality, country];
        }
    }];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (void)didDragMap:(UIGestureRecognizer*)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded){
        [self showLocation];
    }
}
@end
