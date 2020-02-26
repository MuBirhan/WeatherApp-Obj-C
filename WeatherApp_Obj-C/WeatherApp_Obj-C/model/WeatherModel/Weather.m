//
//  Weather.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 24/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "Weather.h"

@implementation Weather

- (instancetype)initWithJSON:(NSDictionary *)dict {
    self = [super init];
      if (self) {
          self.id = [[dict valueForKey:@"id"] intValue];
          self.main = [dict valueForKey:@"main"];
          self.weatherDescription = [dict valueForKey:@"weatherDescription"];
          self.icon = [dict valueForKey:@"icon"];

      }
      return self;
}
@end
