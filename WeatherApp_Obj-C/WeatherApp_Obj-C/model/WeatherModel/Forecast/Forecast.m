//
//  Forecast.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 24/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "Forecast.h"

@implementation Forecast

- (instancetype)initWithJSON:(NSDictionary *)dict {
    self = [super init];
      if (self) {
          self.dt = [[dict objectForKey:@"dt"] longValue];
          self.clounds = [[Clouds alloc] initWithJSON:[dict objectForKey:@"clounds"]];
          self.rain = [[Rain alloc] initWithJSON:[dict objectForKey:@"rain"]];
          self.wind = [[Wind alloc] initWithJSON:[dict objectForKey:@"wind"]];
          self.main = [[Main alloc] initWithJSON:[dict objectForKey:@"main"]];
          NSMutableArray<Weather*>* list = [NSMutableArray new];
          for (NSDictionary *i in [dict objectForKey:@"weather"]) {
              [list addObject:[[Weather alloc] initWithJSON:i]];
          }
          self.weather = [list copy];
      }
      return self;
}

@end
