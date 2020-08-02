//
//  AddViewController.h
//  学生管理系统
//
//  Created by 郭红乐 on 2020/7/29.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "student.h"

NS_ASSUME_NONNULL_BEGIN
@class student;
@protocol AddDelegate <NSObject>

- (void) pass:(student *)student;

@end
@interface AddViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property UITextField *textField;
@property UITextField *textFieldclass;
@property UITextField *textFieldscore;
@property NSMutableArray *nameAry;
@property NSMutableArray *classAry;
@property NSMutableArray *scoreAry;
@property UITableView *tableView;

@property(nonatomic, assign) id <AddDelegate> addDelegate;

@end

NS_ASSUME_NONNULL_END
