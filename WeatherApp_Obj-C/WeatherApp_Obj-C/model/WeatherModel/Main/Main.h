//
//  Main.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 24/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Main : NSObject
@property(nonatomic, assign)double temp;
@property(nonatomic, assign)double humidity;
@property(nonatomic, assign)double pressure;
@property(nonatomic, assign)double temp_min;
@property(nonatomic, assign)double temp_max;

-(instancetype)initWithJSON:(NSDictionary *)dict;


@end

NS_ASSUME_NONNULL_END
