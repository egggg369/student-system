//
//  ModifyTwoViewController.h
//  学生管理系统
//
//  Created by 郭红乐 on 2020/7/30.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>
@class student;
@protocol ModifyTwoDelegate <NSObject>

- (void) ModifyTwoPass1:(NSMutableArray *)nameAry Pass2:(NSMutableArray *)scoreAry Pass3:(NSMutableArray *)classAry;


@end
NS_ASSUME_NONNULL_BEGIN

@interface ModifyTwoViewController : UIViewController <UITableViewDataSource,UITableViewDelegate, UITextFieldDelegate>
@property UITableView *tableView;
@property UITextField *textField;
@property UITextField *textFieldclass;
@property UITextField *textFieldscore;
@property NSMutableArray *nameAry;
@property NSMutableArray *scoreAry;
@property NSMutableArray *classAry;
@property NSString *str;

@property id <ModifyTwoDelegate> modifyTwoDelegate;

@end

NS_ASSUME_NONNULL_END
