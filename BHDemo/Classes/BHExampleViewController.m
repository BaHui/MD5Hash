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
	NSString *lower32Length = [@"abc" md5HashToLower32Length]; // 结果: 900150983cd24fb0d6963f7d28e17f72
	NSString *upper32Length = [@"abc" md5HashToUpper32Length]; // 结果: 900150983CD24FB0D6963F7D28E17F72
	NSLog(@"\nhashResult32BitLower: %@;\nhashResult32BitUpper: %@", lower32Length, upper32Length);

	// 16位 Hash
	NSString *lower16Length = [@"abc" md5HashToLower16Length]; // 结果: 3cd24fb0d6963f7d
	NSString *upper16Length = [@"abc" md5HashToUpper16Length]; // 结果: 3CD24FB0D6963F7D
	NSLog(@"\nhashResult16BitLower: %@;\nhashResult16BitUpper: %@", lower16Length, upper16Length);
}

@end

