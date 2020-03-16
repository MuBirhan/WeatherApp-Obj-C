//
//  LoadingView.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 19/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "LoadingView.h"

@implementation LoadingView

+ (instancetype)sharedIndicator {
    static dispatch_once_t predicate = 0;
    static LoadingView *_sharedIndicator = nil;
    dispatch_once(&predicate, ^{
        _sharedIndicator = [LoadingView instantiateView];
    });
    return _sharedIndicator;
}

+ (instancetype)instantiateView {
    NSString *nibNameOrNil = NSStringFromClass([self class]);
    NSArray *views = nil;
    if(!nibNameOrNil) {
        views = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    } else {
        if (nibNameOrNil.length) {
            views = [[NSBundle mainBundle] loadNibNamed:nibNameOrNil owner:nil options:nil];
        } else {
            return nil;
        }
    }
    return [views firstObject];
}

- (void) startLoading {
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2];
    rotationAnimation.duration = 3.0f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = HUGE_VALF;
    [self.loadingIndicator.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void) stopLoading {
    [self.loadingIndicator.layer removeAllAnimations];
}

@end
