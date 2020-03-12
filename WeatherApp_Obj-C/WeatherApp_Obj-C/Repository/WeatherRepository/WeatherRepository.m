//
//  WeatherRepository.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 21/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "WeatherRepository.h"
#import "AppDelegate.h"
#import "WeatherModel.h"
#import "WeatherEntity+CoreDataClass.h"
#import "UserRepository.h"
#import "UserModel.h"
#import "CoreDataOperations.h"
@import AFNetworking;

NSString *const api = @"f3bf3b86b05011e1636707c720e30545";
NSString *const apiCallLink = @"http://api.openweathermap.org/data/2.5/forecast?units=metric";


@implementation WeatherRepository 

- (void)fetchWeatherWithLat:(double)lat lon:(double)lon andName:(NSString *)name success:(void (^)(BOOL))success error:(void (^)(NSString * _Nullable))errorHandler {
    NSNumber *latitude = [NSNumber numberWithDouble:lat];
    NSNumber *longitude = [NSNumber numberWithDouble:lon];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *params = @{
        @"lat" : latitude,
        @"lon" : longitude,
        @"appid" : api
    };
    [manager GET:apiCallLink parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        WeatherAPIModel *model = [[WeatherAPIModel alloc] initWithJSON:responseObject];
        [[CoreDataOperations new] saveWeatherInCD:model withName:name];
        success(YES);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorHandler(error.localizedDescription);
    }];
}



@end
