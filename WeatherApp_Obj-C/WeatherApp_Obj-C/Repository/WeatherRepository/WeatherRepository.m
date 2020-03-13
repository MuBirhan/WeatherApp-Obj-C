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
#import "UserRepository.h"
#import "CoreDataOperations.h"
@import AFNetworking;

NSString *const api = @"f3bf3b86b05011e1636707c720e30545";
NSString *const apiCallLink = @"http://api.openweathermap.org/data/2.5/forecast?units=metric";


@implementation WeatherRepository {
    CoreDataOperations* cdO;
    NSManagedObjectContext* childContext;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        cdO = [CoreDataOperations new];
        childContext = [cdO getChildContext];
    }
    return self;
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
    WeatherEntity *entityObject = [NSEntityDescription insertNewObjectForEntityForName:@"WeatherEntity" inManagedObjectContext:childContext];
    [[UserRepository new] fetchUser:^(UserEntity * _Nullable user) {
        WeatherModel *weatherModel = [[WeatherModel alloc] initWithAPIResponse:model];
        entityObject.city = weatherModel.city;
        entityObject.imgUrl = weatherModel.imgUrl;
        entityObject.lat = weatherModel.lat;
        entityObject.lon = weatherModel.lon;
        entityObject.mainEvent = weatherModel.mainEvent;
        entityObject.name = name;
        entityObject.rain = weatherModel.rain;
        entityObject.region = weatherModel.region;
        entityObject.temperature = weatherModel.temperature;
        entityObject.time = (int)weatherModel.time;
        entityObject.wind = weatherModel.wind;
        [user addWeatherObject:entityObject];
        [self->childContext save:nil];
        [self->childContext.parentContext performBlock:^{
            [self->cdO saveContext];
        }];
    } error:nil];
    
}

-(NSMutableArray *)fetchWeatherData {
    NSFetchRequest *fetchRequest = [WeatherEntity fetchRequest];
    [fetchRequest setIncludesPendingChanges:YES];
    [fetchRequest setIncludesPropertyValues:YES];
    NSArray *results = [childContext executeFetchRequest:fetchRequest error:nil];
    return [results firstObject];
}

@end
