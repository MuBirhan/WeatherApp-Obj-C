//
//  ErrorHandler.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 18/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "ErrorHandler.h"

@implementation ErrorHandler

- (instancetype)initErrorMessage:(NSString *)errorMessage {
    if (self = [super init]) {
        self.errorMessage = NSLocalizedString(errorMessage, @"");
    }
    return self;
}

@end
