//
//  ModifyViewController.h
//  学生管理系统
//
//  Created by 郭红乐 on 2020/7/29.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModifyTwoViewController.h"
NS_ASSUME_NONNULL_BEGIN
@class student;
@protocol ModifyDelegate <NSObject>

- (void)ModifyPass1:(NSMutableArray *)nameAry Pass2:(NSMutableArray *)scoreAry Pass3:(NSMutableArray *)classAry;

@end



@interface ModifyViewController : UIViewController <UITableViewDelegate,UITableViewDataSource, ModifyTwoDelegate>
@property UITableView *tableView;
@property UITextField *textField;
@property NSMutableArray *nameAry;
@property NSMutableArray *scoreAry;
@property NSMutableArray *classAry;


@property id <ModifyDelegate> modifyDelegate;

@end

NS_ASSUME_NONNULL_END
