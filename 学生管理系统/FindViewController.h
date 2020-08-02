//
//  FindViewController.h
//  学生管理系统
//
//  Created by 郭红乐 on 2020/7/29.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FindViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property UITableView *tableView;
@property UITextField *textField;
@property UITextField *textFieldclass;
@property UITextField *textFieldscore;
@property NSMutableArray *nameAry;
@property NSMutableArray *classAry;
@property NSMutableArray *scoreAry;
@property NSMutableArray *nameAry2;
@property NSMutableArray *classAry2;
@property NSMutableArray *scoreAry2;
@end

NS_ASSUME_NONNULL_END
