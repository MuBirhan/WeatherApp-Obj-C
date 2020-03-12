//
//  Main.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 24/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "Main.h"

@implementation Main

- (instancetype)initWithJSON:(NSDictionary *)dict {
    self = [super init];
      if (self) {
          self.temp = [[dict objectForKey:@"temp"] doubleValue];
          self.humidity = [[dict objectForKey:@"humidity"] doubleValue];
          self.pressure = [[dict objectForKey:@"pressure"] doubleValue];
          self.temp_min = [[dict objectForKey:@"temp_min"] doubleValue];
          self.temp_max = [[dict objectForKey:@"temp_max"] doubleValue];
      }
      return self;
}

@end
