//
//  WeatherRepository.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 21/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "WeatherRepository.h"
@import AFNetworking;
#import "AFNetworking.h"
#import "WeatherAPIModel.h"

@implementation WeatherRepository
- (void)fetchWeatherFromProvider:(void (^)(WeatherAPIModel * _Nullable))success error:(void (^)(NSString * _Nullable))errorHandler {
    NSString *api = [NSString stringWithFormat:@"api.openweathermap.org/data/2.5/forecast?lat={%d}&lon={%d}&appid={%@}", 46, 23, @"f3bf3b86b05011e1636707c720e30545"];
    NSURL *url = [NSURL URLWithString:api];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nullable responseObject) {
        success(responseObject);
//        WeatherAPIModel* model = responseObject;
//        NSLog(@"%@", model.city.country);
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        errorHandler(error.localizedDescription);
    }];
    [operation start];
}

@end
