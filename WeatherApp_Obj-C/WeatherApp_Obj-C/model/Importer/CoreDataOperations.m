//
//  CoreDataOperations.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 12/03/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "CoreDataOperations.h"
#import "AppDelegate.h"
#import "WeatherAPIModel.h"
#import "WeatherEntity+CoreDataProperties.h"
#import "WeatherModel.h"
#import "UserRepository.h"
#import "UserModel.h"
#import "UserEntity+CoreDataProperties.h"
#import "CoreDataOperations.h"

@implementation CoreDataOperations {
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

- (void)saveWeatherInCD:(WeatherAPIModel*)model withName:(NSString *)name {
    WeatherEntity *entityObject = [NSEntityDescription insertNewObjectForEntityForName:@"WeatherEntity" inManagedObjectContext:context];
    UserEntity *user = [[CoreDataOperations new] fetchUser];
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
}

-(NSMutableArray *)fetchWeatherData {
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

-(void)saveUserInCD:(UserModel *)model {
    UserEntity *entityObject = [NSEntityDescription insertNewObjectForEntityForName:@"UserEntity" inManagedObjectContext:context];
    entityObject.userId = model.userId;
    entityObject.email = model.userEmail;
    entityObject.degreePreference = model.degreePreference;
    [appDelegate saveContext];
}

-(UserEntity *)fetchUser {
    NSFetchRequest *fetchRequest = [UserEntity fetchRequest];
    [fetchRequest setIncludesPendingChanges:YES];
    [fetchRequest setIncludesPropertyValues:YES];
    NSArray *results = [context executeFetchRequest:fetchRequest error:nil];
    NSMutableArray<UserEntity *> *items = [[NSMutableArray alloc] init];
    for (UserEntity *cdObject in results) {
        [items addObject:cdObject];
    }
    return items[0];
}

-(void)deleteUserData {
    NSFetchRequest *allUsers = [[NSFetchRequest alloc] init];
    [allUsers setEntity:[NSEntityDescription entityForName:@"UserEntity" inManagedObjectContext:context]];
    [allUsers setIncludesPropertyValues:NO];
    NSError *error = nil;
    NSArray *users = [context executeFetchRequest:allUsers error:&error];
    for (NSManagedObject *user in users) {
      [context deleteObject:user];
    }
    NSError *saveError = nil;
    [context save:&saveError];
}

-(void)createTempUser{
    UserEntity *entityObject = [NSEntityDescription insertNewObjectForEntityForName:@"UserEntity" inManagedObjectContext:context];
    entityObject.userId = @"Temp user";
    entityObject.email = @"Tem email";
    entityObject.degreePreference = Celsius;
    [appDelegate saveContext];
}

@end
