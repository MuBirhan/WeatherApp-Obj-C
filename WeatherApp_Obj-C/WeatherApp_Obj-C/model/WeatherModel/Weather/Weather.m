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
          self.id = [[dict objectForKey:@"id"] intValue];
          self.main = [dict objectForKey:@"main"];
          self.weatherDescription = [dict objectForKey:@"description"];
          self.icon = [dict objectForKey:@"icon"];

      }
      return self;
}
@end
