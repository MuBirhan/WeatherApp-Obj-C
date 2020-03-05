//
//  UserModel.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 04/03/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "UserModel.h"
#import "UserEntity+CoreDataProperties.h"

@implementation UserModel

- (instancetype)initWithId:(NSString *)id andEmail:(NSString *)email {
    self = [super init];
    if (self) {
        self.userId = id;
        self.userEmail = email;
        self.degreePreference = Celsius;
    }
    return self;
}

- (instancetype)initWithUserEntity:(UserEntity *)response {
    self = [super init];
    if (self) {
        self.userId = response.userId;
        self.userEmail = response.email;
        self.degreePreference = response.degreePreference;
    }
    return self;
}

@end
