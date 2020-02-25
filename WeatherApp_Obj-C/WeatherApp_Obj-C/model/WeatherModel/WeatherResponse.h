//
//  WeatherResponse.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 24/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coord.h"
#import "Sys.h"
#import "Weather.h"
#import "Main.h"
#import "Wind.h"

@interface WeatherResponse : NSObject
@property(nonatomic, copy)Coord* coord;
@property(nonatomic, copy)Sys* sys;
@property(nonatomic, copy)NSArray<Weather*> *weather;
@property(nonatomic, copy)Main* main;
@property(nonatomic, copy)Wind* wind;
@property(nonatomic, copy)NSString* rain;
@property(nonatomic, copy)NSString* clouds;
@property(nonatomic, assign)double dt;
@property(nonatomic, assign)int id;
@property(nonatomic, copy)NSString* name;
@property(nonatomic, assign)double code;
@end
