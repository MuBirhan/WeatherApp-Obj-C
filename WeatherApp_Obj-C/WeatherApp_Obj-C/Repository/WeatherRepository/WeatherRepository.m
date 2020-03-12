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
        [self saveWeatherInCD:model withName:name success:^ {
            success(YES);
        } error:^(NSString * _Nullable error) {
            errorHandler(error);
        }];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorHandler(error.localizedDescription);
    }];
}

- (void)saveWeatherInCD:(WeatherAPIModel*)model
               withName:(NSString *)name
                success:(void (^)(void))success
                  error:(void (^)(NSString * _Nullable))errorHandler{
    WeatherEntity *entityObject = [NSEntityDescription insertNewObjectForEntityForName:@"WeatherEntity" inManagedObjectContext:context];
    UserEntity *user = [[UserRepository new] fetchUser];
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
    [appDelegate saveContext];
    NSError *error;
    if (![context save:&error]) {
        [context rollback];
        errorHandler(error.localizedDescription);
    } else {
        success();
    }
}

-(NSMutableArray *)fetchCDData {
    NSFetchRequest *fetchRequest = [WeatherEntity fetchRequest];
    [fetchRequest setIncludesPendingChanges:YES];
    [fetchRequest setIncludesPropertyValues:YES];
    NSArray *results = [context executeFetchRequest:fetchRequest error:nil];
    NSMutableArray<WeatherModel *> *items = [[NSMutableArray alloc] init];
    for (WeatherEntity *cdObject in results) {
        [items addObject:[[WeatherModel alloc] initWithWeatherEntity:cdObject]];
    }
    return items;
}

@end
