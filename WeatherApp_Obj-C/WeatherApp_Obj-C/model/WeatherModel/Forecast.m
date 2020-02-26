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
          self.dt = [[dict valueForKey:@"dt"] longValue];
          self.clounds = [[Clouds alloc] initWithJSON:[dict valueForKey:@"clounds"]];
          self.rain = [[Rain alloc] initWithJSON:[dict valueForKey:@"rain"]];
          self.wind = [[Wind alloc] initWithJSON:[dict valueForKey:@"wind"]];
          self.main = [[Main alloc] initWithJSON:[dict valueForKey:@"main"]];
          NSMutableArray<Weather*>* list = [NSMutableArray new];
          for (NSDictionary *i in [dict valueForKey:@"list"]) {
              [list addObject:[[Weather alloc] initWithJSON:i]];
          }
          self.weather = list;
      }
      return self;
}

@end
