//
//  NewLocationViewController.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 21/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "NewLocationViewController.h"
#import "UIColor+CustomColors.h"
@import MapKit;


@interface NewLocationViewController ()

@end

@implementation NewLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAddButton];
    [self setupInput];
    [self setupBlueButton];
    self.modalView.layer.cornerRadius = 15;
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
    self.useMyLocationButton.layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:self.useMyLocationButton.bounds cornerRadius:self.addbutton.layer.cornerRadius] CGPath];
    self.useMyLocationButton.layer.rasterizationScale = UIScreen.mainScreen.scale;
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
    CLLocationCoordinate2D ceva = [self.mapView convertPoint:CGPointMake(self.mapPointer.frame.size.width/2, self.mapPointer.frame.size.height/2) toCoordinateFromView:self.mapPointer];
    
}
@end
