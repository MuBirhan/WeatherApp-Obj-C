//
//  SignInViewController.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 14/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomInputView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SignInViewController : UIViewController
@property (weak, nonatomic) IBOutlet CustomInputView *emailInput;
@property (weak, nonatomic) IBOutlet CustomInputView *passwordInput;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;

@end

NS_ASSUME_NONNULL_END
