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

+ (UIColor *)blueBackgroundColor {
    UIColor *customBlue = [UIColor colorWithRed:0/255.0 green:144/255.0 blue:255/255.0 alpha:1.0f];
    return customBlue;
}

+ (UIColor *)darkGrayBackgroundColor {
    UIColor *customGrey = [UIColor colorWithRed:112/255.0 green:112/255.0 blue:112/255.0 alpha:1.0f];
    return customGrey;
}

+ (UIColor *)lightGrayBackgroundColor {
    UIColor *customGrey = [UIColor colorWithRed:149/255.0 green:152/255.0 blue:154/255.0 alpha:1.0f];
    return customGrey;
}

+ (UIColor *) greenShadow {
    UIColor *customGreenShadow = [UIColor colorWithRed:76/255.0 green:217/255.0 blue:100/255.0 alpha:0.5f];
    return customGreenShadow;
}

+ (UIColor *) blueShadow {
    UIColor *customBlueShadow = [UIColor colorWithRed:0/255.0 green:144/255.0 blue:255/255.0 alpha:0.5f];
    return customBlueShadow;
}

+ (UIColor *) greyShadow {
    UIColor *customGreyShadow = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.16f];
    return customGreyShadow;
}

+ (UIColor *)rainyBackgroundColor {
    UIColor *backgroundColor = [UIColor colorWithRed:0/255.0 green:144/255.0 blue:255/255.0 alpha:1.0f];
    return backgroundColor;
}

+ (UIColor *)cloudyBackgroundColor {
    UIColor *backgroundColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0f];
    return backgroundColor;
}

+ (UIColor *)sunnyBackgroundColor {
    UIColor *backgroundColor = [UIColor colorWithRed:248/255.0 green:194/255.0 blue:43/255.0 alpha:1.0f];
    return backgroundColor;
}

+ (UIColor *)otherBackgroundColor {
    UIColor *backgroundColor = [UIColor colorWithRed:136/255.0 green:11/255.0 blue:11/255.0 alpha:1.0f];
    return backgroundColor;
}

@end
