//
//  AppDelegate.m
//  superProgram
//
//  Created by 朱孟乐 on 14-10-10.
//  Copyright (c) 2014年 朱孟乐. All rights reserved.
//

#import "AppDelegate.h"

#import "HomeViewController.h"

#import "PeopleViewController.h"

#import "SetupViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    
    [homeViewController setTitle:@"项目管理"];
    
    homeViewController.tabBarItem.image = [UIImage imageNamed:@"register_lbs"];
    
    self.homeNavigationController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    
    self.homeNavigationController.title = @"项目管理";
    
    PeopleViewController *peopleViewController = [[PeopleViewController alloc] init];
    
    [peopleViewController setTitle:@"人员管理"];
    
    peopleViewController.tabBarItem.image = [UIImage imageNamed:@"register_lbs"];
    
    self.peopleNavigationController = [[UINavigationController alloc] initWithRootViewController:peopleViewController];
    
    self.peopleNavigationController.title = @"人员管理";
    
    SetupViewController *setupViewController = [[SetupViewController alloc] init];
    
    [setupViewController setTitle:@"设置"];
    
    setupViewController.tabBarItem.image = [UIImage imageNamed:@"register_lbs"];
    
    self.setupNavigationController = [[UINavigationController alloc] initWithRootViewController:setupViewController];
    
    self.setupNavigationController.title = @"设置";
    
    self.tabBarController = [[UITabBarController alloc] init];
    
    self.tabBarController.delegate = self;
    
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:self.homeNavigationController,self.peopleNavigationController,self.setupNavigationController, nil];
    
    [self.window setRootViewController:self.tabBarController];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
