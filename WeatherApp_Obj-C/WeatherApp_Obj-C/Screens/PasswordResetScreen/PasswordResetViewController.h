//
//  PasswordResetViewController.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 09/03/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CustomInputView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PasswordResetViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (weak, nonatomic) IBOutlet CustomInputView *emailInputView;

@end

NS_ASSUME_NONNULL_END
