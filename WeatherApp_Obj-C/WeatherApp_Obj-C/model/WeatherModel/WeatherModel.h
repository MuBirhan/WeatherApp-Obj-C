//
//  WeatherModel.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 24/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeatherModel : NSObject
@property(nonatomic, copy)NSString* name;
@property(nonatomic, copy)NSString* city;
@property(nonatomic, copy)NSString* region;
@property(nonatomic, assign)double temperature;
@property(nonatomic, copy)NSString* rain;
@property(nonatomic, copy)NSString* wind;
@property(nonatomic, copy)NSString* mainEvent;
@property(nonatomic, copy)NSString* imgUrl;
@property(nonatomic, assign)long time;

@end

NS_ASSUME_NONNULL_END
