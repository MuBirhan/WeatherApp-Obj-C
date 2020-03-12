//
//  SignUpViewController.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 14/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomInputView.h"
#import "BaseViewController.h"

@interface SignUpViewController : BaseViewController
@property (weak, nonatomic) IBOutlet CustomInputView *emailInput;
@property (weak, nonatomic) IBOutlet CustomInputView *passwordInput;
@property (weak, nonatomic) IBOutlet CustomInputView *confirmPasswordInput;
@property (weak, nonatomic) IBOutlet UIButton *nextStepButton;

@end
