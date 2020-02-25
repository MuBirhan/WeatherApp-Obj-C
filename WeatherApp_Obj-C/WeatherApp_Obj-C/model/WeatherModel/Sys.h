//
//  Sys.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 24/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Sys : NSObject
@property(nonatomic, copy)NSString* country;
@property(nonatomic, assign)long sunrise;
@property(nonatomic, assign)long sunset;

@end

NS_ASSUME_NONNULL_END
