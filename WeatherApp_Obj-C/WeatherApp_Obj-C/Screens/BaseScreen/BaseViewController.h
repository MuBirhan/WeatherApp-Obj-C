//
//  BaseViewController.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 18/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadingView.h"

@interface BaseViewController : UIViewController

@property (nonatomic, weak) LoadingView *_Nullable loadingView;

- (void)showLoading;
- (void)hideLoading;
- (void)showError:(NSString *_Nullable)errorMessage;

@end
