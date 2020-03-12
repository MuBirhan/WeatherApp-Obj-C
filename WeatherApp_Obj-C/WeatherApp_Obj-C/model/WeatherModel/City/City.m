//
//  City.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 24/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "City.h"
#import "Coord.h"

@implementation City

- (instancetype)initWithJSON:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.sunset = [[dict objectForKey:@"sunset"] longValue];
        self.country = [dict objectForKey:@"country"];
        self.id = [[dict objectForKey:@"id"] intValue];
        self.coord = [[Coord alloc] initWithJSON:[dict objectForKey:@"coord"]];
        self.population = [[dict objectForKey:@"population"] intValue];
        self.timezone = [[dict objectForKey:@"timezone"] intValue];
        self.sunrise = [[dict objectForKey:@"sunrise"] longValue];
        self.name = [dict objectForKey:@"name"];
    }
    return self;
}

@end
