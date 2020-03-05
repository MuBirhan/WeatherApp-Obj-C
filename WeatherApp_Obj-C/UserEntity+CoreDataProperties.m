//
//  UserEntity+CoreDataProperties.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 05/03/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//
//

#import "UserEntity+CoreDataProperties.h"

@implementation UserEntity (CoreDataProperties)

+ (NSFetchRequest<UserEntity *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"UserEntity"];
}

@dynamic degreePreference;
@dynamic userId;
@dynamic email;
@dynamic weather;

@end
