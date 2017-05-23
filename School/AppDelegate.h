//
//  AppDelegate.h
//  School
//
//  Created by Infinitum on 26/04/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navController;
@property(nonatomic,strong)UITabBarController *tabBarController;
@property(nonatomic,readwrite) int index;
@property(nonatomic,retain) NSString *textfieldColor,*tabStr;
@property(nonatomic,retain) NSString *userRole,*userType;
@end

