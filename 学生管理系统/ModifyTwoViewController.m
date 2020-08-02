//
//  ModifyTwoViewController.m
//  学生管理系统
//
//  Created by 郭红乐 on 2020/7/30.
//  Copyright © 2020 无. All rights reserved.
//

#import "ModifyTwoViewController.h"
#import "HomeTableViewCell.h"
@interface ModifyTwoViewController ()

@end

@implementation ModifyTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.92 green:0.96 blue:1.00 alpha:1.00];
    
    //图片插图
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"修改背景.jpg"]];
    imgView.frame = CGRectMake(self.view.frame.size.width - 260, self.view.frame.size.height - 280, 270, 250);
    imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:imgView atIndex:0];
    
        UIImage *nameImage = [UIImage imageNamed:@"账户.png"];
        UIImageView *nameImageView = [[UIImageView alloc] initWithImage:nameImage];
        nameImageView.frame = CGRectMake(10, 10, 30, 30);
        
        

        UIView *name_View = [[UIView alloc] init];
        name_View.frame = CGRectMake(10, 10, 40, 50);
        [name_View addSubview:nameImageView];
    
    
    
        _textField = [[UITextField alloc] init];
        _textField.frame = CGRectMake(65, 420, 300, 50);
        _textField.font = [UIFont systemFontOfSize:15];
        _textField.textColor = [UIColor blackColor];
        _textField.borderStyle = UITextBorderStyleBezel;
        _textField.keyboardType = UIKeyboardTypeDefault;
        _textField.placeholder = @"请输入修改后姓名...";
        _textField.text = _str;
        _textField.delegate = self;
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
        _textFieldscore.frame = CGRectMake(65, 560, 300, 50);
        _textFieldscore.font = [UIFont systemFontOfSize:15];
        _textFieldscore.textColor = [UIColor blackColor];
        _textFieldscore.borderStyle = UITextBorderStyleBezel;
        _textFieldscore.keyboardType = UIKeyboardTypeDefault;
        _textFieldscore.placeholder = @"请输入修改后成绩...";
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
                _textFieldclass.frame = CGRectMake(65, 490, 300, 50);
                _textFieldclass.font = [UIFont systemFontOfSize:15];
                _textFieldclass.textColor = [UIColor blackColor];
                _textFieldclass.borderStyle = UITextBorderStyleBezel;
                _textFieldclass.keyboardType = UIKeyboardTypeDefault;
                _textFieldclass.placeholder = @"请输入修改后班级";
                _textFieldclass.secureTextEntry = NO;
                [self.view addSubview:_textFieldclass];
                _textFieldclass.leftViewMode = UITextFieldViewModeAlways;
                _textFieldclass.leftView = class_View;
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(90, 640, 100, 40);
    btn.layer.masksToBounds = YES;
    btn.layer.borderWidth = 0.9;
    btn.layer.borderColor = [UIColor colorWithRed:0.60 green:0.60 blue:0.60 alpha:1.00].CGColor;
    btn.layer.cornerRadius = 12;
    [btn setTitle:@"完成" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:0.60 green:0.60 blue:0.60 alpha:1.00] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [btn addTarget:self action:@selector(modify2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    

    UIButton* btn01 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn01.frame = CGRectMake(90, 700, 100, 40);
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
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 600) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    [_tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"home"];
    
    
    
    //键盘消失手势
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tap1.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap1];
    
    
    //键盘上移
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)back
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void) modify2
{
    int i;
    for(i = 0; i < _nameAry.count; i++) {
        if([_nameAry[i] isEqualToString:_str]) {
            [_nameAry replaceObjectAtIndex:i withObject:_textField.text];
            [_scoreAry replaceObjectAtIndex:i withObject:_textFieldscore.text];
            [_classAry replaceObjectAtIndex:i withObject:_textFieldclass.text];
        }
    }
    if([_modifyTwoDelegate respondsToSelector:@selector(ModifyTwoPass1:Pass2:Pass3:)]) {
        [_modifyTwoDelegate ModifyTwoPass1:_nameAry Pass2:_scoreAry Pass3:_classAry];
    }
    [self dismissViewControllerAnimated:NO completion:nil];
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
    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY  + 270 - self.view.frame.size.height);}];
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
