//
//  Rain.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 26/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "Rain.h"

@implementation Rain

- (instancetype)initWithJSON:(NSDictionary *)dict {
    self = [super init];
      if (self) {
          self.h3 = [[dict objectForKey:@"3h"] doubleValue];
      }
      return self;
}
@end
