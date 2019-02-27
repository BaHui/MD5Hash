//
//  NSString+MD5Hash.m
//  BHDemo
//
//  Created by QiaoBaHui on 2018/9/25.
//  Copyright © 2018 QiaoBaHui. All rights reserved.
//

#import "NSString+MD5Hash.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5Hash)

#pragma mark - 32位长度 小写

- (NSString *)md5HashToLower32Length {
	const char *input = [self UTF8String];
	unsigned char result[CC_MD5_DIGEST_LENGTH];
	CC_MD5(input, (CC_LONG)strlen(input), result);
	
	NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
	for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
		[digest appendFormat:@"%02x", result[i]];
	}
	
	return digest;
}

#pragma mark - 32位长度 大写

- (NSString *)md5HashToUpper32Length {
	const char *input = [self UTF8String];
	unsigned char result[CC_MD5_DIGEST_LENGTH];
	CC_MD5(input, (CC_LONG)strlen(input), result);
	
	NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
	for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
		[digest appendFormat:@"%02X", result[i]];
	}
	
	return digest;
}

#pragma mark - 16位长度 小写

- (NSString *)md5HashToLower16Length {
	NSString *md5Str = [self md5HashToLower32Length];
	
	NSString *string = @"";
	if (md5Str.length == 32) {
		string = [md5Str substringWithRange:NSMakeRange(8, 16)];;
	}
	
	return string;
}

#pragma mark - 16位长度 大写

- (NSString *)md5HashToUpper16Length {
	NSString *md5Str = [self md5HashToUpper32Length];
	
	NSString *string = @"";
	if (md5Str.length == 32) {
		string=[md5Str substringWithRange:NSMakeRange(8, 16)];
	}
	
	return string;
}

@end
