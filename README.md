## iOS MD5加密(16位和32位)

### 简介
>  **MD5加密是最常用的不可逆加密方法之一，是将字符串通过相应特征生成一段32位的数字字母混合码。对输入信息生成唯一的128位散列值（32个16进制的数字)**   

>  **但是常见的会有16位和32位长度之分, 实际上MD5产生的就是唯一的32位的长度, 所谓的16位的长度可以理解为对MD5的再加工而形成的. 再加工就是: 32 位字符串中，取中间的第 9 位到第 24 位的部分**

### 加密约定
- 加密结果位数:   **加密结果位数是16位还是32位(大多数都是32位的)。**
- 加密结果大小写:   **MD5加密区分 大小写，使用时要和后台约定好。**

### 声明和实现: (NSString的类别)
```objectivec

@interface NSString (MD5Hash)

// 32位长度 (较为常用)
- (NSString *)md5HashToLower32Length;
- (NSString *)md5HashToUpper32Length;

// 16位长度
- (NSString *)md5HashToLower16Length;
- (NSString *)md5HashToUpper16Length;

@end

```

```objectivec

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

}
```
>   **加盐: 即就是添加"佐料", 如果用户密码数据库不小心被泄露, 黑客就可以通过反查询方式获得用户密码或者对于数据库中出现频率较高的hash码(即很多人使用的)进行暴力破解(因为它通常都是弱口令)**
>   **盐值就是在密码hash过程中添加的额外的随机值, 来提高加密算法, 加Salt可以一定程度上解决这一问题。所谓加Salt方法，就是加点“佐料”。其基本想法是这样的：当用户首次提供密码时（通常是注册时），由系统自动往这个密码里撒一些“佐料”，然后再散列。而当用户登录时，系统为用户提供的代码撒上同样的“佐料”，然后散列，再比较散列值，已确定密码是否正确。**
>  **这里的“佐料”被称作“Salt值”，这个值是由系统随机生成的，并且只有系统知道。这样，即便两个用户使用了同一个密码，由于系统为它们生成的salt值不同，他们的散列值也是不同的。即便黑客可以通过自己的密码和自己生成的散列值来找具有特定密码的用户，但这个几率太小了（密码和salt值都得和黑客使用的一样才行）。**

### 交流与建议
- GitHub：**<https://github.com/BaHui>**
- 邮&nbsp;&nbsp;&nbsp; 箱：**<qiaobahuiyouxiang@163.com>**
