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
          self.temp = [[dict valueForKey:@"temp"] doubleValue];
          self.humidity = [[dict valueForKey:@"humidity"] doubleValue];
          self.pressure = [[dict valueForKey:@"pressure"] doubleValue];
          self.temp_min = [[dict valueForKey:@"temp_min"] doubleValue];
          self.temp_max = [[dict valueForKey:@"temp_max"] doubleValue];
      }
      return self;
}

@end
