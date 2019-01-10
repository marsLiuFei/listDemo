//
//  ViewCreate.h
//  LimiBuyer
//
//  Created by steven on 16/1/30.
//  Copyright © 2016年 limi360. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//  UIControlState
#define Normal          UIControlStateNormal
#define Highlighted     UIControlStateHighlighted
#define Selected        UIControlStateSelected

//  UIControlEvents
#define TouchUpInside   UIControlEventTouchUpInside

//  NSTextAlignment
#define Left    NSTextAlignmentLeft
#define Center  NSTextAlignmentCenter
#define Right   NSTextAlignmentRight

//  UIViewContentMode
#define ScaleToFill         UIViewContentModeScaleToFill
#define ScaleAspectFit      UIViewContentModeScaleAspectFit
#define ScaleAspectFill     UIViewContentModeScaleAspectFill

//  UIColor
#define BlackColor          [UIColor blackColor]
#define DarkGrayColor       [UIColor darkGrayColor]
#define LightGrayColor      [UIColor lightGrayColor]
#define WhiteColor          [UIColor whiteColor]
#define GrayColor           [UIColor grayColor]
#define RedColor            [UIColor redColor]
#define GreenColor          [UIColor greenColor]
#define BlueColor           [UIColor blueColor]
#define CyanColor           [UIColor cyanColor]
#define YellowColor         [UIColor yellowColor]
#define MagentaColor        [UIColor magentaColor]
#define OrangeColor         [UIColor orangeColor]
#define PurpleColor         [UIColor purpleColor]
#define BrownColor          [UIColor brownColor]
#define ClearColor          [UIColor clearColor]

@interface ViewCreate : NSObject

#pragma mark - 创建Label
+ (UILabel *)createLabelFrame:(CGRect)frame
              backgroundColor:(UIColor *)backgroundColor
                         text:(NSString *)text
                    textColor:(UIColor *)textColor
                textAlignment:(NSTextAlignment)textAlignment
                         font:(UIFont *)font;
#pragma mark - 创建Button
+ (UIButton *)createButtonFrame:(CGRect)frame
                          title:(NSString *)title
                     titleColor:(UIColor *)titleColor
                           font:(UIFont *)font
                backgroundColor:(UIColor *)backgroundColor
             touchUpInsideEvent:(void(^)(UIButton *sender))touchUpInsideEvent;
#pragma mark - 创建图片按钮
+ (UIButton *)createButtonFrame:(CGRect)frame
                    normalImage:(NSString *)normalImage
                  selectedImage:(NSString *)selectedImage
             touchUpInsideEvent:(void(^)(UIButton *sender))touchUpInsideEvent;
#pragma mark - 创建背景图片按钮
+ (UIButton *)createButtonFrame:(CGRect)frame
          normalBackgroundImage:(NSString *)normalBackgroundImage
        selectedBackgroundImage:(NSString *)selectedBackgroundImage
             touchUpInsideEvent:(void(^)(UIButton *sender))touchUpInsideEvent;
#pragma mark - 设置按钮的边线颜色和线宽
+ (void)setButtonLayer:(UIButton *)button
           borderColor:(UIColor *)borderColor
           borderWidth:(CGFloat )borderWidth;
#pragma mark - 创建图片视图
+ (UIImageView *)createImageViewFrame:(CGRect)frame
                                image:(NSString *)image;
#pragma mark - 创建一条线
+ (UIView *)createLineFrame:(CGRect)frame
            backgroundColor:(UIColor *)backgroundColor;
#pragma mark - 创建UITextField
+ (UITextField *)createTextFieldFrame:(CGRect)frame
                                 font:(UIFont *)font
                            textColor:(UIColor *)textColor
                          placeHolder:(NSString *)placeHolder
                             delegate:(id<UITextFieldDelegate>)delegate;
#pragma mark - 创建返回按钮
//+ (ExpandButton *)createBackBtn:(void (^)())clickHandle;
@end
