//
//  Clouds.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 26/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "Clouds.h"

@implementation Clouds

- (instancetype)initWithJSON:(NSDictionary *)dict {
    self = [super init];
      if (self) {
          self.all = [[dict objectForKey:@"all"] doubleValue];
      }
      return self;
}

@end
