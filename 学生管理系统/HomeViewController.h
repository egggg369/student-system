//
//  HomeViewController.h
//  学生管理系统
//
//  Created by 郭红乐 on 2020/7/29.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "ModifyViewController.h"
#import "student.h"
NS_ASSUME_NONNULL_BEGIN

@class student;
//4. 添加代理
@interface HomeViewController : UIViewController <UITableViewDelegate,UITableViewDataSource, AddDelegate, DeleteDelegate, ModifyDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property NSMutableArray *nameAry;
@property NSMutableArray *scoreAry;
@property NSMutableArray *classAry;

@property UILabel *nameL;
@property UILabel *classL;
@property UILabel *scoreL;

//@property NSMutableArray *stuAry;

@end

NS_ASSUME_NONNULL_END
