//
//  NSString+MD5Hash.h
//  BHDemo
//
//  Created by QiaoBaHui on 2018/9/25.
//  Copyright © 2018 QiaoBaHui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5Hash)

// 32位长度 (较为常用)
- (NSString *)md5HashToLower32Length;
- (NSString *)md5HashToUpper32Length;

// 16位长度
- (NSString *)md5HashToLower16Length;
- (NSString *)md5HashToUpper16Length;

@end
