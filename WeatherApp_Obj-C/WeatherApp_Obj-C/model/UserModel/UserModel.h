//
//  UserModel.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 04/03/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserEntity+CoreDataClass.h"

typedef NS_ENUM(NSInteger, DegreePreference) {
    Celsius = 0,
    Fahrenheit = 1
};

@interface UserModel : NSObject

@property(nonatomic, strong)NSString* userId;
@property(nonatomic, strong)NSString* userEmail;
@property(nonatomic, assign)DegreePreference degreePreference;

-(instancetype)initWithId:(NSString *)id andEmail:(NSString *)email;
-(instancetype)initWithUserEntity:(UserEntity *)response;

@end

