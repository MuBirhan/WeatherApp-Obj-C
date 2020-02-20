//
//  UserRepository.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 18/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "UserRepository.h"

@implementation UserRepository

- (void) registerUser:(NSString *_Nullable) userEmail
         withPassword:(NSString *_Nullable) password
              success:(void(^_Nullable)(void))success
                error:(void(^_Nullable)(NSString *_Nullable)) errorHandler {
    [[FIRAuth auth] createUserWithEmail:userEmail password:password completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
        if (error) {
            errorHandler(error.localizedDescription);
        } else {
            success();
        }
    }];
}

- (void) loginUser:(NSString *)userEmail
      withPassword:(NSString *)password
           success:(void (^)(void))success
             error:(void (^)(NSString * _Nullable))errorHandler {
    [[FIRAuth auth] signInWithEmail:userEmail password:password completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
        if (error) {
            errorHandler(error.localizedDescription);
        } else {
            success();
        }
    }];
}

- (void) getCurrentUser:(void(^_Nullable)(FIRUser *_Nullable))success
                  error:(void(^_Nullable)(NSString *_Nullable)) errorHandler {
    FIRUser *user = [[FIRAuth auth] currentUser];
    if (user) {
        success(user);
    } else {
        errorHandler(@"No user logged in");
    }
}

- (void) logOutUser:(void(^_Nullable)(BOOL))success
              error:(void(^_Nullable)(NSString *_Nullable)) errorHandler {
    NSError *signOutError;
    BOOL status = [[FIRAuth auth] signOut: &signOutError];
    if (!status) {
        errorHandler(@"Cannot sign out user");
    } else {
        success(YES);
    }
}
@end
