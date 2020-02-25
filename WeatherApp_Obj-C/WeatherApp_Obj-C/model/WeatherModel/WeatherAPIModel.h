//
//  WeatherAPIModel.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 25/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "City.h"
#import "Forecast.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeatherAPIModel : NSObject
@property(nonatomic, assign)double cod;
@property(nonatomic, assign)double message;
@property(nonatomic, copy)City* city;
@property(nonatomic, assign)double cnt;
@property(nonatomic, copy)NSArray<Forecast*>*forecast;

@end

NS_ASSUME_NONNULL_END
