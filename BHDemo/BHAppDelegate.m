//
//  BHAppDelegate.m
//  BHDemo
//
//  Created by QiaoBaHui on 2018/9/18.
//  Copyright © 2018年 QiaoBaHui. All rights reserved.
//

#import "BHAppDelegate.h"
#import "BHExampleViewController.h"

@interface BHAppDelegate ()

@end

@implementation BHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.rootViewController = [BHExampleViewController create];
  [self.window makeKeyAndVisible];

  return YES;
}

@end
