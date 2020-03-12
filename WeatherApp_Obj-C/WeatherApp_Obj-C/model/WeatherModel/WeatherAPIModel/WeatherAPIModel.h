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

@interface WeatherAPIModel : NSObject
@property(nonatomic, assign)double cod;
@property(nonatomic, assign)double message;
@property(nonatomic, strong)City* city;
@property(nonatomic, assign)double cnt;
@property(nonatomic, strong)NSArray<Forecast*>*list;

-(instancetype)initWithJSON:(NSDictionary *)dict;

@end
