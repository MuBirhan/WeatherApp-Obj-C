//
//  WeatherEntity+CoreDataProperties.h
//  
//
//  Created by Muradasil Birhan on 02/03/2020.
//
//

#import "WeatherEntity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface WeatherEntity (CoreDataProperties)

+ (NSFetchRequest<WeatherEntity *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *city;
@property (nullable, nonatomic, copy) NSString *imgUrl;
@property (nonatomic) double lat;
@property (nonatomic) double lon;
@property (nullable, nonatomic, copy) NSString *mainEvent;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) double rain;
@property (nullable, nonatomic, copy) NSString *region;
@property (nonatomic) double temperature;
@property (nonatomic) int64_t time;
@property (nonatomic) double wind;

@end

NS_ASSUME_NONNULL_END
