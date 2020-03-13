//
//  ChangePasswordModalViewController.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 04/03/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CustomInputView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChangePasswordModalViewController : BaseViewController<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *changePasswordButton;
@property (weak, nonatomic) IBOutlet UIView *modalView;
@property (weak, nonatomic) IBOutlet CustomInputView *passwordInput;
@property (weak, nonatomic) IBOutlet CustomInputView *confirmPasswordInput;

@end

NS_ASSUME_NONNULL_END
