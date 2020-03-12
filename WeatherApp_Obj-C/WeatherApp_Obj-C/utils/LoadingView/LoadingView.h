//
//  LoadingView.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 19/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoadingView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *loadingIndicator;

+ (instancetype)sharedIndicator;
- (void) startLoading;
- (void) stopLoading;

@end

NS_ASSUME_NONNULL_END
