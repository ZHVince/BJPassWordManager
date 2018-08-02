//
//  BJPSDView.m
//  passWord
//
//  Created by 铂金数据 on 2018/7/3.
//  Copyright © 2018年 WHT. All rights reserved.
//

#import "BJPSDView.h"
#define  IMAGE1 [UIImage imageNamed:@"customimage1.png"]
#define  IMAGE2 [UIImage imageNamed:@"customimage2.png"]
#define VIEW_WIDTH [UIScreen mainScreen].bounds.size.width
@implementation BJPSDView
{
    NSInteger  _currentLength;
    UIView * _imagesView;
    NSMutableArray * imageArray;
    UIImage * image1;
    UIImage * image2;
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self makeUI];
    }
    return self;
}

-(void)makeUI
{
    CGFloat imageWidth = (VIEW_WIDTH - 24)/6.0;
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 1)];
    lineView.backgroundColor = [UIColor colorWithWhite:204/255.0 alpha:1];
    [self addSubview:lineView];
    
    _imagesView = [[UIView alloc]initWithFrame:CGRectMake(12, 10, VIEW_WIDTH - 24, imageWidth)];
    [self addSubview:_imagesView];
    _imagesView.layer.cornerRadius = 6.0;
    _imagesView.layer.borderWidth = 1;
    _imagesView.layer.borderColor = [UIColor colorWithWhite:204/255.0 alpha:1].CGColor;
    _imagesView.layer.masksToBounds = YES;
    
    imageArray = [NSMutableArray array];
    
    image1 = [UIImage imageNamed:@"customimage1.png"];
    
    image2 = [UIImage imageNamed:@"customimage2.png"];
    
    
    for (int i = 0; i<6; i++) {
        UIImageView * iv = [[UIImageView alloc]initWithFrame:CGRectMake(i*((_imagesView.bounds.size.width+5)/6-1), 0, (_imagesView.bounds.size.width+5)/6, _imagesView.bounds.size.height)];
        iv.userInteractionEnabled = NO;
        iv.image = image1;
        [imageArray addObject:iv];
        [_imagesView addSubview:iv];
    }
    
}
-(void)reloadWithLength:(NSInteger)length
{
    for (UIImageView * iv in imageArray) {
        iv.image = image1;
    }
    for (int i = 0; i<length; i++) {
        UIImageView * iv = imageArray[i];
        //        iv.image = IMAGE2;
        iv.image = image2;
        if (length >6) {
            length = 6;
            //            [_password resignFirstResponder];
            for (int i = 0; i<6; i++) {
                UIImageView * iv = imageArray[i];
                iv.userInteractionEnabled = NO ;
            }
        }
    }
    
    
    
}
-(void)reloadUIWithPassWordLength:(NSInteger)psdLength
{
//    @synchronized(self){
//
//    }
    if (psdLength == (NSInteger)_currentLength) {
        return;
    }
    _currentLength =(NSInteger) psdLength;
    [self reloadWithLength:_currentLength];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
