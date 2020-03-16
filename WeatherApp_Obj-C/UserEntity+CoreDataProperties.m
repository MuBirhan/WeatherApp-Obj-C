//
//  UserEntity+CoreDataProperties.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 13/03/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//
//

#import "UserEntity+CoreDataProperties.h"

@implementation UserEntity (CoreDataProperties)

+ (NSFetchRequest<UserEntity *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"UserEntity"];
}

@dynamic degreePreference;
@dynamic email;
@dynamic userId;
@dynamic weather;

@end
