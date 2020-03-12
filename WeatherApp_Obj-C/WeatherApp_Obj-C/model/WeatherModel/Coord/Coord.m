//
//  Coord.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 24/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "Coord.h"

@implementation Coord

- (instancetype)initWithJSON:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.lon = [[dict objectForKey:@"lon"] longValue];
        self.lat = [[dict objectForKey:@"lat"] longValue];
    }
    return self;
}

@end
