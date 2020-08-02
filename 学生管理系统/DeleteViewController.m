//
//  DeleteViewController.m
//  学生管理系统
//
//  Created by 郭红乐 on 2020/7/29.
//  Copyright © 2020 无. All rights reserved.
//

#import "DeleteViewController.h"
#import "HomeViewController.h"
#import "HomeTableViewCell.h"
@interface DeleteViewController ()
{
int i;
}
@end

@implementation DeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.98 green:0.91 blue:0.91 alpha:1.00];
    
    //图片插图
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"删除背景.jpg"]];
    imgView.frame = CGRectMake(-30, self.view.frame.size.height - 280, 270, 250);
    imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:imgView atIndex:0];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 600) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor clearColor];
     _tableView.tableFooterView = [[UIView alloc] init];
    [_tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"home"];

        UIImage *nameImage = [UIImage imageNamed:@"账户.png"];
        UIImageView *nameImageView = [[UIImageView alloc] initWithImage:nameImage];
        nameImageView.frame = CGRectMake(10, 10, 30, 30);
        
        

        UIView *name_View = [[UIView alloc] init];
        name_View.frame = CGRectMake(10, 10, 40, 50);
        [name_View addSubview:nameImageView];
    
    
    
        _textField = [[UITextField alloc] init];
        _textField.frame = CGRectMake(65, 510, 300, 50);
        _textField.font = [UIFont systemFontOfSize:15];
        _textField.textColor = [UIColor blackColor];
        _textField.borderStyle = UITextBorderStyleBezel;
        _textField.keyboardType = UIKeyboardTypeDefault;
        _textField.placeholder = @"请输入姓名...";
        _textField.secureTextEntry = NO;
        [self.view addSubview: _textField];
        _textField.leftViewMode = UITextFieldViewModeAlways;
        _textField.leftView = name_View;
    
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 610, 100, 40);
    btn.layer.masksToBounds = YES;
    btn.layer.borderWidth = 0.9;
    btn.layer.borderColor = [UIColor colorWithRed:0.60 green:0.60 blue:0.60 alpha:1.00].CGColor;
    btn.layer.cornerRadius = 12;
    [btn setTitle:@"完成" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:0.60 green:0.60 blue:0.60 alpha:1.00] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [btn addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    

    UIButton* btn01 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn01.frame = CGRectMake(230, 610, 100, 40);
    btn01.layer.masksToBounds = YES;
    btn01.layer.borderWidth = 0.9;
    btn01.layer.borderColor = [UIColor colorWithRed:0.60 green:0.60 blue:0.60 alpha:1.00].CGColor;
    btn01.layer.cornerRadius = 12;
    [btn01 setTitle:@"返回" forState:UIControlStateNormal];
    [btn01 setTitleColor:[UIColor colorWithRed:0.60 green:0.60 blue:0.60 alpha:1.00] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn01.titleLabel.font = [UIFont systemFontOfSize:20];
    [btn01 addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn01];
    
    
    //键盘消失手势
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tap1.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap1];
    
    
    //键盘上移
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
    
    
}

- (void) back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) delete
{
    for(i = 0; i < _nameAry.count; i++) {
        if([_nameAry[i] isEqualToString:_textField.text]) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确认是否删除" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self delete2];
            }];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:sure];
            [alert addAction:cancel];
            [self presentViewController:alert animated:NO completion:nil];
            break;
        }
    }
    if(i == _nameAry.count) {
        UIAlertController *alert2 = [UIAlertController alertControllerWithTitle:@"提示" message:@"没找到此人，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert2 addAction:sure2];
        [self presentViewController:alert2 animated:NO completion:nil];
    }
}

- (void)delete2
{
    [_nameAry removeObjectAtIndex:i];
    [_classAry removeObjectAtIndex:i];
    [_scoreAry removeObjectAtIndex:i];
    [self dismissViewControllerAnimated:NO completion:nil];
    if([_deleteDelegate respondsToSelector:@selector(deletepass1:pass2:pass3:)]) {
        [_deleteDelegate deletepass1:_nameAry pass2:_scoreAry pass3:_classAry];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"home" forIndexPath:indexPath];
    [cell give:indexPath Ary1:_nameAry Ary2:_classAry Ary3:_scoreAry];
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _nameAry.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


//键盘上移的两个函数
- (void)keyboardWillDisAppear:(NSNotification *)notification{
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

- (void)keyboardWillAppear:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY  + 180 - self.view.frame.size.height);}];
}

//点击空白处键盘消失
-(void)viewTapped:(UITapGestureRecognizer*)tap1
{

    [self.view endEditing:YES];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
