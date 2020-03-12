//
//  Wind.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 24/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Wind : NSObject
@property(nonatomic, assign)double speed;
@property(nonatomic, assign)double deg;

-(instancetype)initWithJSON:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
