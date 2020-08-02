//
//  RegisterViewController.m
//  学生管理系统
//
//  Created by 郭红乐 on 2020/7/28.
//  Copyright © 2020 无. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
        self.view.backgroundColor = [UIColor colorWithRed:0.90 green:0.83 blue:0.77 alpha:1.00];
        
        
        
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"登陆.jpeg"]];
        imgView.frame = CGRectMake(20, 60, self.view.frame.size.width - 35, 250);
        imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self.view insertSubview:imgView atIndex:0];
        
    
        UIImage *userImage = [UIImage imageNamed:@"账户.png"];
        UIImageView *userImageView = [[UIImageView alloc] initWithImage:userImage];
        userImageView.frame = CGRectMake(10, 10, 30, 30);
        
        

        UIView *user_View = [[UIView alloc] init];
        user_View.frame = CGRectMake(10, 10, 40, 50);
        [user_View addSubview:userImageView];
    
    
    
        _textField = [[UITextField alloc] init];
        _textField.frame = CGRectMake(65, 390, 300, 50);
        _textField.font = [UIFont systemFontOfSize:15];
        _textField.textColor = [UIColor blackColor];
        _textField.borderStyle = UITextBorderStyleBezel;
        _textField.keyboardType = UIKeyboardTypeDefault;
        _textField.placeholder = @"请输入用户名...";
        _textField.secureTextEntry = NO;
        [self.view addSubview: _textField];
        _textField.leftViewMode = UITextFieldViewModeAlways;
        _textField.leftView = user_View;
        
        
        
        
        UIImage *passImage = [UIImage imageNamed:@"密码.png"];
        UIImageView *passImageView = [[UIImageView alloc] initWithImage:passImage];
        passImageView.frame = CGRectMake(10, 10, 30, 30);
        
        UIView *pass_View = [[UIView alloc] init];
        pass_View.frame = CGRectMake(10, 10, 40, 50);
        [pass_View addSubview:passImageView];
        
        _textField01 = [[UITextField alloc] init];
        _textField01.frame = CGRectMake(65, 460, 300, 50);
        _textField01.font = [UIFont systemFontOfSize:15];
        _textField01.textColor = [UIColor blackColor];
        _textField01.borderStyle = UITextBorderStyleBezel;
        _textField01.keyboardType = UIKeyboardTypeDefault;
        _textField01.placeholder = @"请输入密码";
        _textField01.secureTextEntry = YES;
        [self.view addSubview:_textField01];
        _textField01.leftViewMode = UITextFieldViewModeAlways;
        _textField01.leftView = pass_View;
    
    
        UIImage *passImage02 = [UIImage imageNamed:@"密码.png"];
        UIImageView *passImageView02 = [[UIImageView alloc] initWithImage:passImage02];
        passImageView02.frame = CGRectMake(10, 10, 30, 30);

        UIView *pass_View02 = [[UIView alloc] init];
        pass_View02.frame = CGRectMake(10, 10, 40, 50);
        [pass_View02 addSubview:passImageView02];
//
        _textField02 = [[UITextField alloc] init];
        _textField02.frame = CGRectMake(65, 530, 300, 50);
        _textField02.font = [UIFont systemFontOfSize:15];
        _textField02.textColor = [UIColor blackColor];
        _textField02.borderStyle = UITextBorderStyleBezel;
        _textField02.keyboardType = UIKeyboardTypeDefault;
        _textField02.placeholder = @"请确认密码";
        _textField02.secureTextEntry = YES;
        [self.view addSubview:_textField02];
        _textField02.leftViewMode = UITextFieldViewModeAlways;
        _textField02.leftView = pass_View02;
    
    
    
        UIButton* btn01 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn01.frame = CGRectMake(155, 610, 100, 40);
        btn01.layer.masksToBounds = YES;
        btn01.layer.borderWidth = 0.9;
        btn01.layer.borderColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00].CGColor;
        btn01.layer.cornerRadius = 12;
        [btn01 setTitle:@"确认注册" forState:UIControlStateNormal];
        [btn01 setTitleColor:[UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00] forState:UIControlStateNormal];
        btn01.titleLabel.font = [UIFont systemFontOfSize:20];
        [btn01 addTarget:self action:@selector(touchBtn3:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn01];
    
    
    
        //键盘消失手势
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
        tap1.cancelsTouchesInView = NO;
        [self.view addGestureRecognizer:tap1];
    
    
    
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
    
}


- (void)keyboardWillDisAppear:(NSNotification *)notification{
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

- (void)keyboardWillAppear:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY  + 210 - self.view.frame.size.height);}];
}


-(void)viewTapped:(UITapGestureRecognizer*)tap1
{

    [self.view endEditing:YES];

}


- (void)touchBtn3:(UIButton*)button
{
    
    
    if([_textField01.text isEqualToString: _textField02.text])
    {
        
        //3. 让代理去执行自己的方法，取得要传的值
        [self.delegate input: _textField01.text];
        [self.delegate input: _textField.text];
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"两次密码不一致!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:sureAction];
        [self presentViewController:alert animated:NO completion:nil];
        
    }
    
    
    
}


- (void)returnText:(ReturnTextBlock)block {
    self.returnTextBlock = block;
}

- (void)returnText2:(ReturnTextBlock2)block{
    self.returnTextBlock2 = block;
}

- (void)viewWillDisappear:(BOOL)animated {
    if(self.returnTextBlock != nil) {
        self.returnTextBlock(self.textField.text);
        self.returnTextBlock2(self.textField01.text);
    }
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
