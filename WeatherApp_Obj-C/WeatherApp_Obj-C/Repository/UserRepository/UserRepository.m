//
//  UserRepository.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 18/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "UserRepository.h"
#import "AppDelegate.h"
#import "UserModel.h"
#import "UserEntity+CoreDataClass.h"
#import "CoreDataOperations.h"

@interface UserRepository ()

@property(nonatomic, strong) CoreDataOperations *cdO;
@property(nonatomic, strong) NSManagedObjectContext *childContext;

@end

@implementation UserRepository

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cdO = [CoreDataOperations new];
        _childContext = [_cdO getChildContext];
    }
    return self;
}

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
            [self deleteUserData];
            [self saveUserInCD:[[UserModel alloc] initWithId:authResult.user.uid andEmail:authResult.user.email] success:^{
                if (success) {
                    success();
                }
            } error:^(NSString * _Nullable saveError) {
                if (error && errorHandler) {
                    errorHandler(saveError);
                }
            }];
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
        [self deleteUserData];
        success(YES);
    }
}

- (void)changePassword:(NSString *)newPassword
               success:(void (^)(void))success
                 error:(void (^)(NSString * _Nullable))errorHandler {
    [[FIRAuth auth].currentUser updatePassword:newPassword completion:^(NSError * _Nullable error) {
        if(error) {
            errorHandler(error.localizedDescription);
        } else {
            success();
        }
    }];
}

-(void)saveUserInCD:(UserModel *)model
            success:(void (^)(void))success
              error:(void (^)(NSString * _Nullable))errorHandler{
    UserEntity *entityObject = [NSEntityDescription insertNewObjectForEntityForName:@"UserEntity" inManagedObjectContext:self.childContext];
    entityObject.userId = model.userId;
    entityObject.email = model.userEmail;
    entityObject.degreePreference = model.degreePreference;
    NSError *error = nil;
    [self.childContext save:&error];
    [self.childContext.parentContext performBlock:^{
        [self.cdO saveContext];
        if (error && errorHandler) {
            errorHandler(error.localizedDescription);
        } else if (success) {
            success();
        }
    }];
}

- (void)fetchUser:(void (^)(UserEntity*))success
            error:(void (^)(NSString * _Nullable))errorHandler{
    NSFetchRequest *fetchRequest = [UserEntity fetchRequest];
    [fetchRequest setIncludesPendingChanges:YES];
    [fetchRequest setIncludesPropertyValues:YES];
    NSError *error = nil;
    NSArray *results = [[[CoreDataOperations new] getChildContext] executeFetchRequest:fetchRequest error:&error];
    if (error && errorHandler) {
        errorHandler(error.localizedDescription);
    } else {
        success([results firstObject]);
    }
}

-(void)deleteUserData {
    NSFetchRequest *allUsers = [[NSFetchRequest alloc] init];
    [allUsers setEntity:[NSEntityDescription entityForName:@"UserEntity" inManagedObjectContext:self.childContext]];
    [allUsers setIncludesPropertyValues:NO];
    NSError *error = nil;
    NSArray *users = [self.childContext executeFetchRequest:allUsers error:&error];
    for (NSManagedObject *user in users) {
        [self.childContext deleteObject:user];
//        [self.childContext.parentContext performBlock:^{
//            [self.childContext.parentContext deleteObject:user];
//        }];
    }
    [self.childContext save:nil];
    [self.childContext.parentContext performBlock:^{
        [self.cdO saveContext];
    }];
}

//-(void)deleteUUserData {
//    NSFetchRequest *allUsers = [[NSFetchRequest alloc] init];
//    [allUsers setEntity:[NSEntityDescription entityForName:@"WeatherEntity" inManagedObjectContext:self.childContext]];
//    [allUsers setIncludesPropertyValues:NO];
//    NSError *error = nil;
//    NSArray *users = [self.childContext executeFetchRequest:allUsers error:&error];
//    for (NSManagedObject *user in users) {
//        [self.childContext deleteObject:user];
//        [self.childContext.parentContext performBlock:^{
//            [self.childContext.parentContext deleteObject:user];
//        }];
//    }
//    [self.childContext save:nil];
//    [self.childContext.parentContext performBlock:^{
//        [self.cdO saveContext];
//    }];
//}

-(void)createTempUser{
    UserEntity *entityObject = [NSEntityDescription insertNewObjectForEntityForName:@"UserEntity" inManagedObjectContext:self.childContext];
    entityObject.userId = @"Temp user";
    entityObject.email = @"Temp email";
    entityObject.degreePreference = Celsius;
    [self.cdO saveContext];
}

@end
