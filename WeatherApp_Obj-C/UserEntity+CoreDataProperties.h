//
//  UserEntity+CoreDataProperties.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 05/03/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//
//

#import "UserEntity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface UserEntity (CoreDataProperties)

+ (NSFetchRequest<UserEntity *> *)fetchRequest;

@property (nonatomic) int16_t degreePreference;
@property (nullable, nonatomic, copy) NSString *userId;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, retain) NSSet<WeatherEntity *> *weather;

@end

@interface UserEntity (CoreDataGeneratedAccessors)

- (void)addWeatherObject:(WeatherEntity *)value;
- (void)removeWeatherObject:(WeatherEntity *)value;
- (void)addWeather:(NSSet<WeatherEntity *> *)values;
- (void)removeWeather:(NSSet<WeatherEntity *> *)values;

@end

NS_ASSUME_NONNULL_END
