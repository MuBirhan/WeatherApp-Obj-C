//
//  WeatherAPIModel.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 25/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "WeatherAPIModel.h"
#import "City.h"


@implementation WeatherAPIModel

- (instancetype)initWithJSON:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.message = [[dict objectForKey:@"message"] doubleValue];
        self.cnt = [[dict objectForKey:@"cnt"] doubleValue];
        self.cod = [[dict objectForKey:@"cod"] doubleValue];
        NSMutableArray<Forecast*>* list = [NSMutableArray new];
        for (NSDictionary *i in [dict objectForKey:@"list"]) {
            [list addObject:[[Forecast alloc] initWithJSON:i]];
        }
        self.list = [list copy];
        self.city = [[City alloc] initWithJSON:[dict objectForKey:@"city"]];
    }
    return self;
}

@end
