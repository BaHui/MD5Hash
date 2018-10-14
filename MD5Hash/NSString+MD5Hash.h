//
//  NSString+MD5Hash.h
//  BHDemo
//
//  Created by QiaoBaHui on 2018/9/25.
//  Copyright © 2018 QiaoBaHui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5Hash)

// 32位 (较为常用)
- (NSString *)md5HashToLower32Bit;
- (NSString *)md5HashToUpper32Bit;

// 16位
- (NSString *)md5HashToLower16Bit;
- (NSString *)md5HashToUpper16Bit;

@end
