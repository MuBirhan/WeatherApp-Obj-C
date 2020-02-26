//
//  City.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 24/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coord.h"

NS_ASSUME_NONNULL_BEGIN

@interface City : NSObject
@property(nonatomic, assign)int id;
@property(nonatomic, strong)NSString* name;
@property(nonatomic, strong)Coord* coord;
@property(nonatomic, strong)NSString* country;
@property(nonatomic, assign)int population;
@property(nonatomic, assign)int timezone;
@property(nonatomic, assign)long sunset;
@property(nonatomic, assign)long sunrise;


-(instancetype)initWithJSON:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
