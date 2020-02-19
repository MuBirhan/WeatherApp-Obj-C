//
//  ErrorHandler.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 18/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ErrorHandler : NSObject

@property (nonatomic, strong) NSString *errorMessage;

-(instancetype)initErrorMessage:(NSString *)errorMessage;

@end
