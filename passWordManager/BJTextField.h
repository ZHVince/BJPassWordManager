//
//  BJTextField.h
//  huichaopay
//
//  Created by 铂金数据 on 2018/7/20.
//  Copyright © 2018年 张恒. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BJTextField : UITextField
@property (nonatomic, strong) NSString * value;
//通用密码键盘 //0数字密码   1全键盘密码
-(id)initWithFrame:(CGRect)frame withType:(NSInteger)type;
@end
