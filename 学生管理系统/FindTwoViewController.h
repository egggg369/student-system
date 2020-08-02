//
//  FindTwoViewController.h
//  学生管理系统
//
//  Created by 郭红乐 on 2020/7/31.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FindTwoViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property UITableView *tableView;
@property NSMutableArray *nameAry;
@property NSMutableArray *scoreAry;
@property NSMutableArray *classAry;

@end

NS_ASSUME_NONNULL_END
