//
//  CustomInputView.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 17/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomInputView : UIView

@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *userInput;
@property (nonatomic) IBInspectable NSString *labelName;
@property (nonatomic) IBInspectable NSString *inputPlaceholder;
@property (nonatomic) IBInspectable BOOL isPassword;
@property (weak, nonatomic) IBOutlet UILabel *errorMessage;
@end
