//
//  AppDelegate.h
//  superProgram
//
//  Created by 朱孟乐 on 14-10-10.
//  Copyright (c) 2014年 朱孟乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(strong,nonatomic)UINavigationController *homeNavigationController;

@property(strong,nonatomic)UINavigationController *peopleNavigationController;

@property(strong,nonatomic)UINavigationController *setupNavigationController;

@property(strong,nonatomic)UITabBarController *tabBarController;

@end

