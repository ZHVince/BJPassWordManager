//
//  ZHPassWordField.m
//  passWord
//
//  Created by 铂金数据 on 2018/7/3.
//  Copyright © 2018年 WHT. All rights reserved.
//

#import "BJPassWordField.h"
#import "BJPSDView.h"
#define PSD_HEIGHT 80
@implementation BJPassWordField
{
    BJPSDView * _psdView;
    NSTimer * _timer;
    
}
//6位支付密码密码键盘
+(BJPassWordField *)defaultPSD
{
    static BJPassWordField * PF = nil ;
    if (!PF) {
        PF = [[BJPassWordField alloc]init];
    }
    [PF cleanPWD];
    [PF settings];
    return PF;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.delegate = self;
        self.frame = CGRectMake(0, 0, 0, 0  );
    }
    return self;
}
-(id)init
{
    self = [super init];
    if (self) {
        [self settings];
        self.delegate = self;
    }
    return self;
}
-(void)dealloc
{
    _timer.fireDate = [NSDate distantFuture];
    [_timer invalidate];
    _timer = nil;
    _psdView = nil;
}

-(void)settings
{
    self.keyboardType = UIKeyboardTypeNumberPad;
    self.secureTextEntry = YES;
    if (!_psdView) {
        _psdView = [[BJPSDView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, PSD_HEIGHT)];
        _psdView.backgroundColor = [UIColor whiteColor];
    }
    self.inputAccessoryView = _psdView;
    if (!_timer) {
        __block BJPassWordField * weakSelf = self;
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.2 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [weakSelf refreshPSDView:super.text.length];
            
            if (super.text.length == weakSelf.maxLength) {
                timer.fireDate = [NSDate distantFuture];
                //延时处理避免更新点UI之前就发送数据请求，可能造成最后一位点未显示
                [weakSelf performSelector:@selector(outPassWord) withObject:nil afterDelay:0.2];
            }
            
        }];
    }
    _timer.fireDate = [NSDate distantPast];
}

-(void)cleanPWD
{
    super.text = @"";
    [self refreshPSDView:0];
}
-(void)outPassWord
{
    if (self.inputPassWordFinishedBlock) {
        self.inputPassWordFinishedBlock([self value]);
    }
}
-(void)refreshPSDView:(NSInteger)psdLength
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [_psdView reloadUIWithPassWordLength:psdLength];
    });
    
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
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    _timer.fireDate = [NSDate distantFuture];
    return YES;
}
//监听每次的输入
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSInteger psdLength = super.text.length;
    if (psdLength == self.maxLength) {
        return NO;
    }
//    if ([string isEqualToString:@""]) {
//        //点击返回按钮
//
//    }else{
//        if (psdLength == self.maxLength-1) {
//            //输入第四位的时候开始
//            _timer.fireDate = [NSDate distantPast];
//        }
//    }
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
