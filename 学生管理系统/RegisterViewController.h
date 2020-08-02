//
//  RegisterViewController.h
//  学生管理系统
//
//  Created by 郭红乐 on 2020/7/28.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//1. 声明代理
@protocol RegisterDelegate <NSObject>

- (void) input:(NSString *)text;

@end


@interface RegisterViewController : UIViewController
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITextField *textField01;
@property (nonatomic, strong) UITextField *textField02;

typedef void (^ReturnTextBlock)(NSString *showText);
typedef void (^ReturnTextBlock2)(NSString *showText);

@property ReturnTextBlock returnTextBlock;
@property ReturnTextBlock2 returnTextBlock2;
-(void)returnText:(ReturnTextBlock)block;
-(void)returnText2:(ReturnTextBlock2)block;

//2.生成一个成员变量，便于访问设置
@property(nonatomic,assign)id <RegisterDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
