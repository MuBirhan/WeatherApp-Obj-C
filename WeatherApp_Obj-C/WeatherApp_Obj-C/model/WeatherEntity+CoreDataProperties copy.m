//
//  WeatherEntity+CoreDataProperties.m
//  
//
//  Created by Muradasil Birhan on 02/03/2020.
//
//

#import "WeatherEntity+CoreDataProperties.h"

@implementation WeatherEntity (CoreDataProperties)

+ (NSFetchRequest<WeatherEntity *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"WeatherEntity"];
}

@dynamic city;
@dynamic imgUrl;
@dynamic lat;
@dynamic lon;
@dynamic mainEvent;
@dynamic name;
@dynamic rain;
@dynamic region;
@dynamic temperature;
@dynamic time;
@dynamic wind;

@end
