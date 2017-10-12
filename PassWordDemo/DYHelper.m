//
//  DYHelper.m
//  PassWordDemo
//
//  Created by mengdy on 17/10/11.
//  Copyright © 2017年 mengdy. All rights reserved.
//

#import "DYHelper.h"

@implementation DYHelper

/** 判断是不是全数字 */
+(BOOL) isHaveAllNumber:(NSString *)string
{
    NSString *regex =@"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    return [pred evaluateWithObject:string];
}

/** 判断是不是全字母*/
+(BOOL) isHaveAllChar:(NSString *)string
{
    NSString *regex =@"[a-zA-Z]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:string];
}

/**全是特殊字符*/
+(BOOL) isHaveIllegalChar:(NSString *)string
{
    NSString *regex = @"[~`!@#$%^&*()_+-=[]|{};':\",./<>?]{,}/";//规定的特殊字符，可以自己随意添加
    //计算字符串长度
    NSInteger str_length = [string length];
    
    NSInteger allIndex = 0;
    for (int i = 0; i<str_length; i++) {
        //取出i
        NSString *subStr = [string substringWithRange:NSMakeRange(i, 1)];
        if([regex rangeOfString:subStr].location != NSNotFound)
        {  //存在
            allIndex++;
        }
    }
    if (str_length == allIndex) {
        //纯特殊字符
        return YES;
    }else{
        //非纯特殊字符
        return NO;
    }
}



@end
