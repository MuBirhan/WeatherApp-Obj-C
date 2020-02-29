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

@import AFNetworking;

NSString *const api = @"f3bf3b86b05011e1636707c720e30545";
NSString *const apiCallLink = @"http://api.openweathermap.org/data/2.5/forecast?units=metric";


@implementation WeatherRepository {
    AppDelegate *appDelegate;
    NSManagedObjectContext *context;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self getContext];
    }
    return self;
}

- (void)getContext {
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    context = appDelegate.persistentContainer.viewContext;
}

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
        [self saveWeatherInCD:model withName:name];
        success(YES);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorHandler(error.localizedDescription);
    }];
}

- (void)saveWeatherInCD:(WeatherAPIModel*)model withName:(NSString *)name {
    NSManagedObject *entityObject = [NSEntityDescription insertNewObjectForEntityForName:@"WeatherEntity" inManagedObjectContext:context];
    WeatherModel *weatherModel = [[WeatherModel alloc] initWithAPIResponse:model];
    [entityObject setValue:weatherModel.city forKey:@"city"];
    [entityObject setValue:weatherModel.imgUrl forKey:@"imgUrl"];
    [entityObject setValue:@(weatherModel.lat) forKey:@"lat"];
    [entityObject setValue:@(weatherModel.lon) forKey:@"lon"];
    [entityObject setValue:weatherModel.mainEvent forKey:@"mainEvent"];
    [entityObject setValue:name forKey:@"name"];
    [entityObject setValue:@(weatherModel.rain) forKey:@"rain"];
    [entityObject setValue:weatherModel.region forKey:@"region"];
    [entityObject setValue:@(weatherModel.temperature) forKey:@"temperature"];
    [entityObject setValue:@(weatherModel.time) forKey:@"time"];
    [entityObject setValue:@(weatherModel.wind) forKey:@"wind"];
    [appDelegate saveContext];
}

@end
