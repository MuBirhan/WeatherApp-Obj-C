//
//  CoreDataOperations.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 12/03/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherAPIModel.h"
#import "UserModel.h"
#import "UserEntity+CoreDataProperties.h"

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataOperations : NSObject
@property (readonly, strong) NSPersistentContainer *persistentContainer;
- (void)saveContext;
-(NSManagedObjectContext*) getChildContext;
@end

NS_ASSUME_NONNULL_END
