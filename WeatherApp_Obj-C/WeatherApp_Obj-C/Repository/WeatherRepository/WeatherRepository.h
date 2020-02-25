//
//  WeatherRepository.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 21/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherAPIModel.h"

@interface WeatherRepository : NSObject
-(void)fetchWeatherFromProvider:(void(^_Nullable)(WeatherAPIModel* _Nullable))success
                          error:(void(^_Nullable)(NSString *_Nullable)) errorHandler;
@end
