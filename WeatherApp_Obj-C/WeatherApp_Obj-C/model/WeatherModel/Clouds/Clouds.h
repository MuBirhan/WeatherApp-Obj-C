//
//  Clouds.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 26/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Clouds : NSObject

@property(nonatomic, assign)double all;

-(instancetype)initWithJSON:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
