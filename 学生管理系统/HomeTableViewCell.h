//
//  HomeTableViewCell.h
//  学生管理系统
//
//  Created by 郭红乐 on 2020/7/29.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeTableViewCell : UITableViewCell

@property UILabel *nameL;
@property UILabel *classL;
@property UILabel *scoreL;

@property NSMutableArray *stuAry;

- (void)give:(NSIndexPath *)indexPath Ary1:(nonnull NSMutableArray *)nameAry Ary2:(nonnull NSMutableArray *)scoreAry Ary3:(nonnull NSMutableArray *)classAry;
//- (void)give:(NSIndexPath *)indexPath Ary1:(nonnull NSMutableArray *)_stuAry;
@end

NS_ASSUME_NONNULL_END
