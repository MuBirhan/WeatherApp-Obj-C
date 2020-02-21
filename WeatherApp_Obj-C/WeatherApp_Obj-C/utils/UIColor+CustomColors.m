//
//  UIColor+CustomColors.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 17/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "UIColor+CustomColors.h"

@implementation UIColor (CustomColors)

+ (UIColor *) greenButton {
    UIColor *customGreen = [UIColor colorWithRed:76/255.0 green:217/255.0 blue:100/255.0 alpha:1.0f];
    return customGreen;
}
+ (UIColor *) blueButton {
    UIColor *customBlue = [UIColor colorWithRed:0/255.0 green:111/255.0 blue:255/255.0 alpha:1.0f];
    return customBlue;
}

+ (UIColor *) greenShadow {
    UIColor *customGreenShadow = [UIColor colorWithRed:76/255.0 green:217/255.0 blue:100/255.0 alpha:0.5f];
    return customGreenShadow;
}

+ (UIColor *) blueShadow {
    UIColor *customBlueShadow = [UIColor colorWithRed:0/255.0 green:144/255.0 blue:255/255.0 alpha:0.5f];
    return customBlueShadow;
}
@end
