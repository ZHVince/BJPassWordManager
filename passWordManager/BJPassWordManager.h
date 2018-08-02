//
//  BJPassWordManager.h
//  passWord
//
//  Created by 铂金数据 on 2018/7/3.
//  Copyright © 2018年 WHT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BJPassWordManager : NSObject

//弹出密码键盘， block为密码输入成功后回调，passWord为返回的密码
+(void)showPassWordWithFinishedBlock:(void (^)( NSString *passWord))block;
//隐藏密码键盘
+(void)hidenPassWord;
+(void)cleanPWD;
@end
