//
//  BJPassWordManager.m
//  passWord
//
//  Created by 铂金数据 on 2018/7/3.
//  Copyright © 2018年 WHT. All rights reserved.
//

#import "BJPassWordManager.h"
#import "BJPassWordField.h"
@implementation BJPassWordManager
+(void)showPassWordWithFinishedBlock:(void (^)( NSString *passWord))block
{
    BJPassWordField * pf = [BJPassWordField defaultPSD];
    pf.maxLength = 6;
    pf.inputPassWordFinishedBlock = ^(NSString *passWord) {
        
        block([passWord copy]);
    };
    [[UIApplication sharedApplication].keyWindow addSubview:pf];
    [pf becomeFirstResponder];
}
+(void)hidenPassWord
{
    dispatch_async(dispatch_get_main_queue(), ^{
        BJPassWordField * pf = [BJPassWordField defaultPSD];
        [pf resignFirstResponder];

    });
    
}
+(void)cleanPWD
{
    dispatch_async(dispatch_get_main_queue(), ^{
        BJPassWordField * pf = [BJPassWordField defaultPSD];
        [pf cleanPWD];
        
    });
}
@end
