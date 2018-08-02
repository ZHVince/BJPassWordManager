//
//  ZHPassWordField.h
//  passWord
//
//  Created by 铂金数据 on 2018/7/3.
//  Copyright © 2018年 WHT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BJPassWordField : UITextField<UITextFieldDelegate>

+(BJPassWordField *)defaultPSD;
-(void)cleanPWD;
//密码最大长度，到达最大长度后自动提交
@property (nonatomic, assign) NSInteger maxLength;

@property (copy) void(^inputPassWordFinishedBlock)(NSString * passWord);
@end
