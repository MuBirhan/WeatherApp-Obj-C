//
//  NewLocationViewController.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 21/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;


@interface NewLocationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *locationNameInput;
@property (weak, nonatomic) IBOutlet UIButton *addbutton;
@property (weak, nonatomic) IBOutlet UIButton *useMyLocationButton;
@property (weak, nonatomic) IBOutlet UIView *modalView;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIImageView *mapPointer;
- (IBAction)centerToCurrentLocation:(id)sender;
- (IBAction)addLocation:(id)sender;

@end
