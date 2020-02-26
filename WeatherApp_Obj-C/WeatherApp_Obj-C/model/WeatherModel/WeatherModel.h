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
@property(nonatomic, strong)NSString* name;
@property(nonatomic, strong)NSString* city;
@property(nonatomic, strong)NSString* region;
@property(nonatomic, assign)double temperature;
@property(nonatomic, strong)NSString* rain;
@property(nonatomic, strong)NSString* wind;
@property(nonatomic, strong)NSString* mainEvent;
@property(nonatomic, strong)NSString* imgUrl;
@property(nonatomic, assign)long time;

@end

NS_ASSUME_NONNULL_END
