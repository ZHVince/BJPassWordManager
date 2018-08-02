//
//  BJTextField.m
//  huichaopay
//
//  Created by 铂金数据 on 2018/7/20.
//  Copyright © 2018年 张恒. All rights reserved.
//

#import "BJTextField.h"

@implementation BJTextField
//通用密码键盘 //0数字密码   1全键盘密码
-(id)initWithFrame:(CGRect)frame withType:(NSInteger)type
{
    self = [super initWithFrame:frame];
    if (self) {
        [self cleanPWD];
        [self setPWDWithType:type];
    }
    return self;
}
-(void)setPWDWithType:(NSInteger)type
{
    if (type == 0) {
        //数字
        self.keyboardType = UIKeyboardTypeNumberPad;
    }else if(type == 1){
        //全键盘
        self.keyboardType = UIKeyboardTypeAlphabet;
    }else{
        self.keyboardType = UIKeyboardTypeDefault;
    }
    
    self.secureTextEntry = YES;
    
}
-(void)cleanPWD
{
    super.text = @"";
}
-(NSString *)value
{
    NSString * psd = super.text;
    //后期在这里添加自动加密功能
    return psd;
}
-(NSString *)text
{
    return @"不支持直接获取密码";
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
