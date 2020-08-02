//
//  HomeTableViewCell.m
//  学生管理系统
//
//  Created by 郭红乐 on 2020/7/29.
//  Copyright © 2020 无. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "HomeViewController.h"
@implementation HomeTableViewCell


- (void)give:(NSIndexPath *)indexPath Ary1:(nonnull NSMutableArray *)nameAry Ary2:(nonnull NSMutableArray *)scoreAry Ary3:(nonnull NSMutableArray *)classAry
{

    
    self.nameL.text = nameAry[indexPath.row];
    self.classL.text = classAry[indexPath.row];
    self.scoreL.text = scoreAry[indexPath.row];
    
    self.backgroundColor = [UIColor clearColor];
}

//- (void)give:(NSIndexPath *)indexPath Ary1:(nonnull NSMutableArray *)_stuAry
//{
//
//
//    self.nameL.text = [_stuAry[indexPath.row] nameStr];
//    self.classL.text = [_stuAry[indexPath.row] classStr];
//    self.scoreL.text = [_stuAry[indexPath.row]scoreStr];
//
//    self.backgroundColor = [UIColor clearColor];
//}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _nameL = [[UILabel alloc] init];
    [self.contentView addSubview:_nameL];
    
    
    _scoreL = [[UILabel alloc] init];
    [self.contentView addSubview:_scoreL];
    
    _classL = [[UILabel alloc]init];
    [self.contentView addSubview:_classL];
    
    
    return self;
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    _nameL.frame = CGRectMake(10, 25, 100, 20);
    _nameL.font = [UIFont systemFontOfSize:20];
    _nameL.textAlignment = NSTextAlignmentCenter;
    _nameL.textColor = [UIColor colorWithRed:0.88 green:0.59 blue:0.58 alpha:1.00];
    
    _classL.frame = CGRectMake(135, 25, 150, 20);
    _classL.font = [UIFont systemFontOfSize:20];
    _classL.textAlignment = NSTextAlignmentCenter;
    _classL.textColor = [UIColor colorWithRed:0.88 green:0.59 blue:0.58 alpha:1.00];
    
    _scoreL.frame = CGRectMake(280, 25, 150, 20);
    _scoreL.font = [UIFont systemFontOfSize:20];
    _scoreL.textAlignment = NSTextAlignmentCenter;
    _scoreL.textColor = [UIColor colorWithRed:0.88 green:0.59 blue:0.58 alpha:1.00];
    
}






- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
