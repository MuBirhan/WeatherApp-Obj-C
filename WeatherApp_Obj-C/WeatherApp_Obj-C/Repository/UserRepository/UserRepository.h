//
//  UserRepository.h
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 18/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ErrorHandler.h"
@import Firebase;

@interface UserRepository : NSObject
@property (weak, nonatomic) FIRAuth * _Nullable firebaseAuth;

- (void) registerUser:(NSString *_Nullable) userEmail
         withPassword:(NSString *_Nullable) password
              success:(void(^_Nullable)(void))success
                error:(void(^_Nullable)(NSString *_Nullable)) errorHandler;

- (void) getCurrentUser:(void(^_Nullable)(FIRUser *_Nullable))success
                  error:(void(^_Nullable)(NSString *_Nullable)) errorHandler;

- (void) logOutUser:(void(^_Nullable)(BOOL))success
              error:(void(^_Nullable)(NSString *_Nullable)) errorHandler;
@end
