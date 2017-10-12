//
//  DYHelper.h
//  PassWordDemo
//
//  Created by mengdy on 17/10/11.
//  Copyright © 2017年 mengdy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DYHelper : NSObject

/** 判断是不是全数字 */
+(BOOL) isHaveAllNumber:(NSString *)string;
/** 判断是不是全字母*/
+(BOOL) isHaveAllChar:(NSString *)string;
/**全是特殊字符*/
+(BOOL) isHaveIllegalChar:(NSString *)string;

@end
