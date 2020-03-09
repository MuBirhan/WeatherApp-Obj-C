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

@implementation UserRepository {
    AppDelegate *appDelegate;
    NSManagedObjectContext *context;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self getContext];
    }
    return self;
}

-(void)getContext {
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    context = appDelegate.persistentContainer.viewContext;
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
            [self deleteData];
            [self saveUserInCD:[[UserModel alloc] initWithId:authResult.user.uid andEmail:authResult.user.email]];
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
        [self deleteData];
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

-(void)vrifyPasswordResetCode:(NSString *)code success:(void (^)(void))success error:(void (^)(NSString * _Nullable))errorHandler {
    [[FIRAuth auth] verifyPasswordResetCode:code completion:^(NSString * _Nullable email, NSError * _Nullable error) {
        if(error) {
            errorHandler(error.localizedDescription);
        } else {
            success();
        }
    }];
}

-(void)confirmResetCode:(NSString *)code forPassword:(NSString *)password success:(void (^)(void))success error:(void (^)(NSString * _Nullable))errorHandler {
    [[FIRAuth auth] confirmPasswordResetWithCode:code newPassword:password completion:^(NSError * _Nullable error) {
        if(error) {
            errorHandler(error.localizedDescription);
        } else {
            success();
        }
    }];
}

-(void)forgotPasswordForEmail:(NSString *)email success:(void (^)(void))success error:(void (^)(NSString * _Nullable))errorHandler {
    [[FIRAuth auth] sendPasswordResetWithEmail:email completion:^(NSError * _Nullable error) {
        if(error) {
            errorHandler(error.localizedDescription);
        } else {
            success();
        }
    }];
}

-(void)saveUserInCD:(UserModel *)model {
    UserEntity *entityObject = [NSEntityDescription insertNewObjectForEntityForName:@"UserEntity" inManagedObjectContext:context];
    entityObject.userId = model.userId;
    entityObject.email = model.userEmail;
    entityObject.degreePreference = model.degreePreference;
    [appDelegate saveContext];
}

-(UserEntity *)fetchUser {
    NSFetchRequest *fetchRequest = [UserEntity fetchRequest];
    [fetchRequest setIncludesPendingChanges:YES];
    [fetchRequest setIncludesPropertyValues:YES];
    NSArray *results = [context executeFetchRequest:fetchRequest error:nil];
    NSMutableArray<UserEntity *> *items = [[NSMutableArray alloc] init];
    for (UserEntity *cdObject in results) {
        [items addObject:cdObject];
    }
    return items[0];
}

-(void)deleteData {
    NSFetchRequest *allUsers = [[NSFetchRequest alloc] init];
    [allUsers setEntity:[NSEntityDescription entityForName:@"UserEntity" inManagedObjectContext:context]];
    [allUsers setIncludesPropertyValues:NO];
    NSError *error = nil;
    NSArray *users = [context executeFetchRequest:allUsers error:&error];
    for (NSManagedObject *user in users) {
        [context deleteObject:user];
    }
    NSError *saveError = nil;
    [context save:&saveError];
}

-(void)createTempUser{
    UserEntity *entityObject = [NSEntityDescription insertNewObjectForEntityForName:@"UserEntity" inManagedObjectContext:context];
    entityObject.userId = @"Temp user";
    entityObject.email = @"Tem email";
    entityObject.degreePreference = Celsius;
    [appDelegate saveContext];
}

@end
