//
//  LandViewController.h
//  学生管理系统
//
//  Created by 郭红乐 on 2020/7/28.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"
NS_ASSUME_NONNULL_BEGIN
//4. 第四步
@interface LandViewController : UIViewController <RegisterDelegate>
@property  UITextField *textField;
@property  UITextField *textField01;
@end

NS_ASSUME_NONNULL_END
