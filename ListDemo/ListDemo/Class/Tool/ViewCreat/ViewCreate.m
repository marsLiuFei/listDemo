//
//  ViewCreate.m
//  LimiBuyer
//
//  Created by steven on 16/1/30.
//  Copyright © 2016年 limi360. All rights reserved.
//

#import "ViewCreate.h"

@implementation ViewCreate

#pragma mark - 创建Label
+ (UILabel *)createLabelFrame:(CGRect)frame
              backgroundColor:(UIColor *)backgroundColor
                         text:(NSString *)text
                    textColor:(UIColor *)textColor
                textAlignment:(NSTextAlignment)textAlignment
                         font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc]init];
    label.frame = frame;
    label.backgroundColor = backgroundColor;
    label.text = text;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    label.font = font;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    label.highlighted = NO;
    label.userInteractionEnabled = NO;
    label.numberOfLines = 1;
    label.adjustsFontSizeToFitWidth = NO;
    return label;
}

#pragma mark - 创建Button
+ (UIButton *)createButtonFrame:(CGRect)frame
                          title:(NSString *)title
                     titleColor:(UIColor *)titleColor
                           font:(UIFont *)font
                backgroundColor:(UIColor *)backgroundColor
             touchUpInsideEvent:(void(^)(UIButton *))touchUpInsideEvent
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.selected = NO;
    [button setTitle:title forState:UIControlStateNormal];
//    [button setTitle:title forState:UIControlStateHighlighted];
//    [button setTitle:title forState:UIControlStateSelected];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    button.backgroundColor = backgroundColor;
//    [button handleControlEvent:TouchUpInside withBlock:^(id sender) {
//        if (touchUpInsideEvent) {
//            touchUpInsideEvent(sender);
//        }
//    }];
    return button;
}

#pragma mark - 创建图片按钮
+ (UIButton *)createButtonFrame:(CGRect)frame
                    normalImage:(NSString *)normalImage
                  selectedImage:(NSString *)selectedImage
             touchUpInsideEvent:(void(^)(UIButton *))touchUpInsideEvent
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    button.frame = frame;
    button.selected = NO;
    [button setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
//    [button handleControlEvent:TouchUpInside withBlock:^(id sender) {
//        if (touchUpInsideEvent) {
//            touchUpInsideEvent(sender);
//        }
//    }];
    return button;
}

#pragma mark - 创建背景图片按钮
+ (UIButton *)createButtonFrame:(CGRect)frame
          normalBackgroundImage:(NSString *)normalBackgroundImage
        selectedBackgroundImage:(NSString *)selectedBackgroundImage
             touchUpInsideEvent:(void(^)(UIButton *))touchUpInsideEvent
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    button.frame = frame;
    button.selected = NO;
    [button setBackgroundImage:[UIImage imageNamed:normalBackgroundImage] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selectedBackgroundImage] forState:UIControlStateSelected];
//    [button handleControlEvent:TouchUpInside withBlock:^(id sender) {
//        if (touchUpInsideEvent) {
//            touchUpInsideEvent(sender);
//        }
//    }];
    return button;
}

#pragma mark - 设置按钮的边线颜色和线宽
+ (void)setButtonLayer:(UIButton *)button
           borderColor:(UIColor *)borderColor
           borderWidth:(CGFloat )borderWidth
{
    button.layer.masksToBounds = YES;
    button.layer.borderColor = borderColor.CGColor;
    button.layer.borderWidth = borderWidth;
}

#pragma mark - 创建图片视图
+ (UIImageView *)createImageViewFrame:(CGRect)frame
                                image:(NSString *)image
{
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = frame;
    imageView.image = [UIImage imageNamed:image];
    imageView.highlightedImage = nil;
    imageView.highlighted = NO;
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.backgroundColor = ClearColor;
    imageView.userInteractionEnabled = NO;
    imageView.animationImages = nil;
    
    return imageView;
}

#pragma mark - 创建一条线
+ (UIView *)createLineFrame:(CGRect)frame
            backgroundColor:(UIColor *)backgroundColor
{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = backgroundColor;
    
    return line;
}

#pragma mark - 创建UITextField
+ (UITextField *)createTextFieldFrame:(CGRect)frame
                                 font:(UIFont *)font
                            textColor:(UIColor *)textColor
                          placeHolder:(NSString *)placeHolder
                             delegate:(id<UITextFieldDelegate>)delegate
{
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    textField.font = font;
    textField.textColor = textColor;
    textField.placeholder = placeHolder;
    textField.delegate = delegate;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
//    textField.inputAccessoryView = [[REActionBar alloc]initWithDelegate:(id<REActionBarDelegate>)delegate];
    return textField;
}




@end
