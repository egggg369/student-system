//
//  HomeViewController.m
//  学生管理系统
//
//  Created by 郭红乐 on 2020/7/29.
//  Copyright © 2020 无. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "FindViewController.h"
#import "ModifyViewController.h"
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "student.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.94 green:0.88 blue:0.88 alpha:1.00];
    
    //图片插图
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"主页背景.png"]];
    imgView.frame = CGRectMake(self.view.frame.size.width - 270, self.view.frame.size.height - 280, 270, 250);
    imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:imgView atIndex:0];
    
    
    UIButton *buttonadd = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:buttonadd];
    buttonadd.frame = CGRectMake(60, 510, 100, 40);
    buttonadd.layer.masksToBounds = YES;
    buttonadd.layer.borderWidth = 0.9;
    buttonadd.layer.borderColor = [UIColor colorWithRed:0.88 green:0.59 blue:0.58 alpha:1.00].CGColor;
    buttonadd.layer.cornerRadius = 12;
    [buttonadd setTitle:@"添加" forState:UIControlStateNormal];
    buttonadd.tintColor = [UIColor colorWithRed:0.88 green:0.59 blue:0.58 alpha:1.00];
    buttonadd.titleLabel.font = [UIFont systemFontOfSize:23];
    [buttonadd addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttondelete = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:buttondelete];
    buttondelete.frame = CGRectMake(220, 510, 100, 40);
    buttondelete.layer.masksToBounds = YES;
    buttondelete.layer.borderWidth = 0.9;
    buttondelete.layer.borderColor = [UIColor colorWithRed:0.88 green:0.59 blue:0.58 alpha:1.00].CGColor;
    buttondelete.layer.cornerRadius = 12;
    [buttondelete setTitle:@"删除" forState:UIControlStateNormal];
    buttondelete.tintColor = [UIColor colorWithRed:0.88 green:0.59 blue:0.58 alpha:1.00];
    buttondelete.titleLabel.font = [UIFont systemFontOfSize:23];
    [buttondelete addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *buttonmodify = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:buttonmodify];
    buttonmodify.frame = CGRectMake(60, 580, 100, 40);
    buttonmodify.layer.masksToBounds = YES;
    buttonmodify.layer.borderWidth = 0.9;
    buttonmodify.layer.borderColor = [UIColor colorWithRed:0.88 green:0.59 blue:0.58 alpha:1.00].CGColor;
    buttonmodify.layer.cornerRadius = 12;
    [buttonmodify setTitle:@"修改" forState:UIControlStateNormal];
    buttonmodify.tintColor = [UIColor colorWithRed:0.88 green:0.59 blue:0.58 alpha:1.00];
    buttonmodify.titleLabel.font = [UIFont systemFontOfSize:23];
    [buttonmodify addTarget:self action:@selector(modify) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *buttonfind = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:buttonfind];
    buttonfind.frame = CGRectMake(220, 580, 100, 40);
    buttonfind.layer.masksToBounds = YES;
    buttonfind.layer.borderWidth = 0.9;
    buttonfind.layer.borderColor = [UIColor colorWithRed:0.88 green:0.59 blue:0.58 alpha:1.00].CGColor;
    buttonfind.layer.cornerRadius = 12;
    [buttonfind setTitle:@"查找" forState:UIControlStateNormal];
    buttonfind.tintColor = [UIColor colorWithRed:0.88 green:0.59 blue:0.58 alpha:1.00];
    buttonfind.titleLabel.font = [UIFont systemFontOfSize:23];
    [buttonfind addTarget:self action:@selector(find) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonexit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:buttonexit];
    buttonexit.frame = CGRectMake(60, 650, 100, 40);
    buttonexit.layer.masksToBounds = YES;
    buttonexit.layer.borderWidth = 0.9;
    buttonexit.layer.borderColor = [UIColor colorWithRed:0.88 green:0.59 blue:0.58 alpha:1.00].CGColor;
    buttonexit.layer.cornerRadius = 12;
    [buttonexit setTitle:@"退出" forState:UIControlStateNormal];
    buttonexit.tintColor = [UIColor colorWithRed:0.88 green:0.59 blue:0.58 alpha:1.00];
    buttonexit.titleLabel.font = [UIFont systemFontOfSize:23];
    [buttonexit addTarget:self action:@selector(exit) forControlEvents:UIControlEventTouchUpInside];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 500) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"home"];
    
    _nameAry = [[NSMutableArray alloc] init];
    [_nameAry addObject:@"海绵宝宝"];
    [_nameAry addObject:@"派大星"];
    [_nameAry addObject:@"章鱼哥"];
    [_nameAry addObject:@"蟹老板"];

    _classAry = [[NSMutableArray alloc] init];
    [_classAry addObject:@"a班"];
    [_classAry addObject:@"b班"];
    [_classAry addObject:@"c班"];
    [_classAry addObject:@"d班"];

    _scoreAry = [[NSMutableArray alloc] init];
    [_scoreAry addObject:@"67"];
    [_scoreAry addObject:@"89"];
    [_scoreAry addObject:@"78"];
    [_scoreAry addObject:@"92"];
    
//    _stuAry = [[NSMutableArray alloc] init];
//
//    student *stu = [[student alloc] init];
//    stu.classStr = @"a班";
//    stu.nameStr = @"派大星";
//    stu.scoreStr = @"89";
//    [_stuAry addObject:stu];
    
    //NSLog(@"%@", _stuAry[0]);
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _nameAry.count;
    //return _stuAry.count;
    //return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"home" forIndexPath:indexPath];
    
//    student *stu = [[student alloc] init];
//    stu = _stuAry[indexPath.row];
    
//    cell.nameL.text = stu.nameStr;
//    cell.classL.text = [_stuAry[indexPath.row] classStr];
//    cell.scoreL.text = [_stuAry[indexPath.row] scoreStr];
    
    
    //[cell give:indexPath Ary1:_stuAry];
    [cell give:indexPath Ary1:_nameAry Ary2:_scoreAry Ary3:_classAry];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void) exit
{
    exit(0);
}

- (void) add
{
    AddViewController *addViewController = [[AddViewController alloc] init];
    addViewController.nameAry = _nameAry;
    addViewController.scoreAry = _scoreAry;
    addViewController.classAry = _classAry;
    addViewController.addDelegate = self;
    addViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:addViewController animated:YES completion:nil];
//    UIWindow *window = self.view.window;
//
//    [window makeKeyAndVisible];
//
//    AddViewController *addViewController = [[AddViewController alloc] init];
//
//    window.rootViewController =addViewController;
}

- (void) delete
{
    DeleteViewController *deleteViewController = [[DeleteViewController alloc] init];
    deleteViewController.nameAry = _nameAry;
    deleteViewController.classAry = _classAry;
    deleteViewController.scoreAry = _scoreAry;
    deleteViewController.deleteDelegate = self;
    deleteViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:deleteViewController animated:YES completion:nil];
}

- (void)modify
{
    ModifyViewController *modifyViewController = [[ModifyViewController alloc] init];
    modifyViewController.nameAry = _nameAry;
    modifyViewController.classAry = _classAry;
    modifyViewController.scoreAry = _scoreAry;
    modifyViewController.modifyDelegate = self;
    modifyViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:modifyViewController animated:YES completion:nil];
}


- (void) find
{
    FindViewController *findViewController = [[FindViewController alloc] init];
    findViewController.nameAry = _nameAry;
    findViewController.classAry = _classAry;
    findViewController.scoreAry = _scoreAry;
    findViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:findViewController animated:YES completion:nil];
}

- (void)pass:(student *)stu
{
    [_nameAry addObject:stu.nameStr];
    [_scoreAry addObject:stu.scoreStr];
    [_classAry addObject:stu.classStr];
    [_tableView reloadData];
}

- (void)deletepass1:(NSMutableArray *)nameAry pass2:(NSMutableArray *)scoreAry pass3:(NSMutableArray *)classAry
{
    _nameAry = nameAry;
    _scoreAry = scoreAry;
    _classAry = classAry;
    [_tableView reloadData];
}

- (void)ModifyPass1:(NSMutableArray *)nameAry Pass2:(NSMutableArray *)scoreAry Pass3:(NSMutableArray *)classAry
{
    _nameAry = nameAry;
    _scoreAry = scoreAry;
    _classAry = classAry;
    [_tableView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
