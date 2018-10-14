//
//  BHExampleViewController.m
//  BHDemo
//
//  Created by QiaoBaHui on 2018/9/18.
//  Copyright © 2018年 QiaoBaHui. All rights reserved.
//

#import "BHExampleViewController.h"
#import "NSString+MD5Hash.h"

@interface BHExampleViewController ()

@end

static NSString *const DEMO_VIEWS_STORYBOARD_NAME = @"DemoViews";

@implementation BHExampleViewController

+ (instancetype)create {
  UIStoryboard *demoViewsStoryboard = [UIStoryboard storyboardWithName:DEMO_VIEWS_STORYBOARD_NAME bundle:nil];
  return [demoViewsStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([BHExampleViewController class])];
}

#pragma mark - ViewController LifeCycle

- (void)viewDidLoad {
  [super viewDidLoad];

	// 32位 Hash
	NSString *hashResult32BitLower = [@"abc" md5HashToLower32Bit]; // 结果: 900150983cd24fb0d6963f7d28e17f72
	NSString *hashResult32BitUpper = [@"abc" md5HashToUpper32Bit]; // 结果: 900150983CD24FB0D6963F7D28E17F72
	NSLog(@"hashResult32BitLower: %@; hashResult32BitUpper: %@", hashResult32BitLower, hashResult32BitUpper);

	// 16位 Hash
	NSString *hashResult16BitLower = [@"abc" md5HashToLower16Bit]; // 结果: 3cd24fb0d6963f7d
	NSString *hashResult16BitUpper = [@"abc" md5HashToUpper16Bit]; // 结果: 3CD24FB0D6963F7D
	NSLog(@"hashResult16BitLower: %@; hashResult16BitUpper: %@", hashResult16BitLower, hashResult16BitUpper);
}

@end

