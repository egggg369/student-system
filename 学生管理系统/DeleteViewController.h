//
//  DeleteViewController.h
//  学生管理系统
//
//  Created by 郭红乐 on 2020/7/29.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "student.h"
NS_ASSUME_NONNULL_BEGIN
@class student;
@protocol DeleteDelegate <NSObject>

- (void)deletepass1:(NSMutableArray *)nameAry pass2:(NSMutableArray *)scoreAry pass3:(NSMutableArray *)classAry;

@end



@interface DeleteViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property UITableView *tableView;
@property UITextField *textField;
@property NSMutableArray *nameAry;
@property NSMutableArray *classAry;
@property NSMutableArray *scoreAry;
@property id <DeleteDelegate> deleteDelegate;

@end

NS_ASSUME_NONNULL_END
