//
//  WeatherEntity+CoreDataProperties.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 05/03/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
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
@dynamic user;

@end
