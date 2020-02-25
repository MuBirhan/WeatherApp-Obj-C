//
//  Weather.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 24/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Weather : NSObject
@property(nonatomic, assign)int id;
@property(nonatomic, copy)NSString* main;
@property(nonatomic, copy)NSString* weatherDescription;
@property(nonatomic, copy)NSString* icon;
@end

NS_ASSUME_NONNULL_END
