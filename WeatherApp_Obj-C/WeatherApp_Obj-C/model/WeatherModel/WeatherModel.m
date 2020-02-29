//
//  WeatherModel.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 24/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "WeatherModel.h"

NSString *const preUrl = @"http://openweathermap.org/img/wn/";
NSString *const postUrl = @"@2x.png";

@implementation WeatherModel

- (instancetype)initWithAPIResponse:(WeatherAPIModel *)model {
    self = [super init];
    if (self) {
        self.city = model.city.name;
        self.region = model.city.country;
        self.temperature = model.list[0].main.temp;
        self.rain = model.list[0].rain.h3;
        self.wind = model.list[0].wind.speed;
        self.mainEvent = model.list[0].weather[0].description;
        self.imgUrl = [NSString stringWithFormat:@"%@%@%@", preUrl, model.list[0].weather[0].icon, postUrl];
        self.lon = model.city.coord.lon;
        self.lat = model.city.coord.lat;
        self.time = (long)(NSTimeInterval)(long)(NSTimeInterval)[[NSDate date] timeIntervalSince1970];
    }
    return self;
}

- (instancetype)initWithCDResponse:(NSDictionary *)response {
    self = [super init];
      if (self) {
          self.city = [response valueForKey:@"city"];
          self.region = [response valueForKey:@"region"];
          self.temperature = [[response valueForKey:@"temperature"] doubleValue];
          self.rain = [[response valueForKey:@"rain"] doubleValue];
          self.wind = [[response valueForKey:@"wind"] doubleValue];
          self.mainEvent = [response valueForKey:@"mainEvent"];
          self.imgUrl = [response valueForKey:@"imgUrl"];
          self.lon = [[response valueForKey:@"lon"] doubleValue];
          self.lat = [[response valueForKey:@"lat"] doubleValue];
          self.time = [[response valueForKey:@"time"] intValue];
          self.name = [response valueForKey:@"name"];
      }
      return self;
}

@end
