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
        self.sunset = [[dict valueForKey:@"sunset"] longValue];
        self.country = [dict valueForKey:@"country"];
        self.id = [[dict valueForKey:@"id"] intValue];
        self.coord = [[Coord alloc] initWithJSON:[dict valueForKey:@"coord"]];
        self.population = [[dict valueForKey:@"population"] intValue];
        self.timezone = [[dict valueForKey:@"timezone"] intValue];
        self.sunrise = [[dict valueForKey:@"sunrise"] longValue];
        self.name = [dict valueForKey:@"name"];
    }
    return self;
}

@end
