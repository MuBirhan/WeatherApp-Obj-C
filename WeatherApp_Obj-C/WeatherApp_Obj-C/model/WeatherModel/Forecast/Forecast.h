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
#import "Clouds.h"
#import "Rain.h"

NS_ASSUME_NONNULL_BEGIN

@interface Forecast : NSObject
@property(nonatomic, assign)long dt;
@property(nonatomic, strong)Main* main;
@property(nonatomic, strong)NSArray<Weather *> *weather;
@property(nonatomic, strong)Clouds* clounds;
@property(nonatomic, strong)Wind* wind;
@property(nonatomic, strong)Rain* rain;

-(instancetype)initWithJSON:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
