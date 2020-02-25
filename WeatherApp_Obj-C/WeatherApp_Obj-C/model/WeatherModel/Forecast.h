//
//  Forecast.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 24/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Main.h"
#import "Weather.h"
#import "Wind.h"

NS_ASSUME_NONNULL_BEGIN

@interface Forecast : NSObject
@property(nonatomic, assign)long dt;
@property(nonatomic, copy)Main* main;
@property(nonatomic, strong)NSArray<Weather *> *weather;
@property(nonatomic, copy)NSString* clounds;
@property(nonatomic, copy)Wind* wind;
@property(nonatomic, copy)NSString* rain;
@end

NS_ASSUME_NONNULL_END
