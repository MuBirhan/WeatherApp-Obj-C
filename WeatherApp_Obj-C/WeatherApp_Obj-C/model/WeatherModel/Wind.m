//
//  Wind.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 24/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "Wind.h"

@implementation Wind

- (instancetype)initWithJSON:(NSDictionary *)dict {
    self = [super init];
      if (self) {
          self.speed = [[dict valueForKey:@"speed"] doubleValue];
          self.deg = [[dict valueForKey:@"deg"] doubleValue];
      }
      return self;
}

@end
