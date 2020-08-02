//
//  AddViewController.m
//  学生管理系统
//
//  Created by 郭红乐 on 2020/7/29.
//  Copyright © 2020 无. All rights reserved.
//

#import "AddViewController.h"
#import "HomeViewController.h"
#import "HomeTableViewCell.h"
@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.91 green:0.98 blue:1.00 alpha:1.00];
    
    //图片插图
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"增加背景.jpg"]];
    imgView.frame = CGRectMake(self.view.frame.size.width - 240, self.view.frame.size.height - 280, 270, 250);
    imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:imgView atIndex:0];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 620) style:UITableViewStylePlain];
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
        _textField.frame = CGRectMake(65, 460, 300, 50);
        _textField.font = [UIFont systemFontOfSize:15];
        _textField.textColor = [UIColor blackColor];
        _textField.borderStyle = UITextBorderStyleBezel;
        _textField.keyboardType = UIKeyboardTypeDefault;
        _textField.placeholder = @"请输入姓名...";
        _textField.secureTextEntry = NO;
        [self.view addSubview: _textField];
        _textField.leftViewMode = UITextFieldViewModeAlways;
        _textField.leftView = name_View;
    
    
        UIImage *scoreImage = [UIImage imageNamed:@"成绩.png"];
        UIImageView *scoreImageView = [[UIImageView alloc] initWithImage:scoreImage];
        scoreImageView.frame = CGRectMake(10, 10, 30, 30);
        
        

        UIView *score_View = [[UIView alloc] init];
        score_View.frame = CGRectMake(10, 10, 40, 50);
        [score_View addSubview:scoreImageView];
    
    
    
        _textFieldscore = [[UITextField alloc] init];
        _textFieldscore.frame = CGRectMake(65, 600, 300, 50);
        _textFieldscore.font = [UIFont systemFontOfSize:15];
        _textFieldscore.textColor = [UIColor blackColor];
        _textFieldscore.borderStyle = UITextBorderStyleBezel;
        _textFieldscore.keyboardType = UIKeyboardTypeDefault;
        _textFieldscore.placeholder = @"请输入成绩...";
        _textFieldscore.secureTextEntry = NO;
        [self.view addSubview: _textFieldscore];
        _textFieldscore.leftViewMode = UITextFieldViewModeAlways;
        _textFieldscore.leftView = score_View;
    
    
                UIImage *classImage = [UIImage imageNamed:@"班级.png"];
                UIImageView *classImageView = [[UIImageView alloc] initWithImage:classImage];
                classImageView.frame = CGRectMake(10, 10, 30, 30);

                UIView *class_View = [[UIView alloc] init];
                class_View.frame = CGRectMake(10, 10, 40, 50);
                [class_View addSubview:classImageView];
        
                _textFieldclass = [[UITextField alloc] init];
                _textFieldclass.frame = CGRectMake(65, 530, 300, 50);
                _textFieldclass.font = [UIFont systemFontOfSize:15];
                _textFieldclass.textColor = [UIColor blackColor];
                _textFieldclass.borderStyle = UITextBorderStyleBezel;
                _textFieldclass.keyboardType = UIKeyboardTypeDefault;
                _textFieldclass.placeholder = @"请输入班级";
                _textFieldclass.secureTextEntry = NO;
                [self.view addSubview:_textFieldclass];
                _textFieldclass.leftViewMode = UITextFieldViewModeAlways;
                _textFieldclass.leftView = class_View;
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(120, 680, 100, 40);
    btn.layer.masksToBounds = YES;
    btn.layer.borderWidth = 0.9;
    btn.layer.borderColor = [UIColor colorWithRed:0.60 green:0.60 blue:0.60 alpha:1.00].CGColor;
    btn.layer.cornerRadius = 12;
    [btn setTitle:@"完成" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:0.60 green:0.60 blue:0.60 alpha:1.00] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [btn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    

    UIButton* btn01 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn01.frame = CGRectMake(120, 740, 100, 40);
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

- (void) add
{
    if(_textFieldclass.text.length <= 0 || _textField.text.length <= 0 || _textFieldscore.text.length <= 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"输入不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureaction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:sureaction];
        [self presentViewController:alert animated:NO completion:nil];
    }else {
        int i;
        for(i = 0; i < _nameAry.count; i++) {
            if([_nameAry[i] isEqualToString:_textField.text]){
                break;
            }
        }
        if(i != _nameAry.count){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"姓名有重复！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:sure];
            [self presentViewController:alert animated:NO completion:nil];
        }
        if(i == _nameAry.count) {
            [self dismissViewControllerAnimated:NO completion:nil];
            if([_addDelegate respondsToSelector:@selector(pass:)]) {
                student *stu = [[student alloc] init];
                stu.nameStr = _textField.text;
                stu.classStr = _textFieldclass.text;
                stu.scoreStr = _textFieldscore.text;
                //3.代理执行自己的方法
                [self.addDelegate pass:stu];
            }
        }
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


//键盘上移的两个函数
- (void)keyboardWillDisAppear:(NSNotification *)notification{
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

- (void)keyboardWillAppear:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY  + 100 - self.view.frame.size.height);}];
}

//点击空白处键盘消失
-(void)viewTapped:(UITapGestureRecognizer*)tap1
{

    [self.view endEditing:YES];

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
