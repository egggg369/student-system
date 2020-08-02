//
//  LandViewController.m
//  学生管理系统
//
//  Created by 郭红乐 on 2020/7/28.
//  Copyright © 2020 无. All rights reserved.
//

#import "LandViewController.h"
#import "RegisterViewController.h"
#import "HomeViewController.h"
@interface LandViewController ()
{
     NSString *userStr;
     NSString *passStr;
}
@end

@implementation LandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.90 green:0.83 blue:0.77 alpha:1.00];
    
    
    //图片插图
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
    
    
    
    //用户名文本框
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
    
    
    //密码文本框
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
    
    
    //登陆
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 540, 100, 40);
    btn.layer.masksToBounds = YES;
    btn.layer.borderWidth = 0.9;
    btn.layer.borderColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00].CGColor;
    btn.layer.cornerRadius = 12;
    [btn setTitle:@"登陆" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [btn addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    userStr = [[NSString alloc] init];
    passStr = [[NSString alloc] init];
    
    
    //注册
    UIButton* btn01 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn01.frame = CGRectMake(230, 540, 100, 40);
    btn01.layer.masksToBounds = YES;
    btn01.layer.borderWidth = 0.9;
    btn01.layer.borderColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00].CGColor;
    btn01.layer.cornerRadius = 12;
    [btn01 setTitle:@"注册" forState:UIControlStateNormal];
    [btn01 setTitleColor:[UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn01.titleLabel.font = [UIFont systemFontOfSize:20];
    [btn01 addTarget:self action:@selector(touchBtn2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn01];
    
    

    
    
    //键盘消失手势
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tap1.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap1];
    
    
    //键盘上移
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
    
}


//键盘上移的两个函数
- (void)keyboardWillDisAppear:(NSNotification *)notification{
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

- (void)keyboardWillAppear:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY  + 280 - self.view.frame.size.height);}];
}

//点击空白处键盘消失
-(void)viewTapped:(UITapGestureRecognizer*)tap1
{

    [self.view endEditing:YES];

}


- (void)touchBtn1:(UIButton *)button
{
    
    NSString *name = @"qaz";
    NSString *pass = @"123";
    
    NSString *strName = _textField.text;
    NSString *strPass = _textField01.text;
    if(_textField.text.length <= 0 || _textField01.text.length <= 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"输入不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureaction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:sureaction];
        [self presentViewController:alert animated:NO completion:nil];
        return;
    }else if(([name isEqualToString:strName] && [pass isEqualToString:strPass]) || ([strName isEqualToString:userStr] && [strPass isEqualToString:passStr] )) {
            UIWindow *window = self.view.window;
            
            [window makeKeyAndVisible];
            
            HomeViewController *vchome = [[HomeViewController alloc] init];
            
            window.rootViewController = vchome;
    }else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"账号与密码不匹配!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:sureAction];
        [self presentViewController:alert animated:NO completion:nil];
    }
    
}


//点注册按钮
- (void)touchBtn2:(UIButton*)button
{
    RegisterViewController *vcRegister = [[RegisterViewController alloc] init];
    
    //5. 设定代理
    vcRegister.delegate = self;

    [vcRegister returnText:^(NSString *showText){
         self->_textField.text = showText;
         self->userStr = showText;
    }];
    [vcRegister returnText2:^(NSString *showText){
         self->_textField01.text = showText;
         self->passStr = showText;
    }];
    
    vcRegister.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vcRegister animated:YES completion:nil];
    //[self.navigationController pushViewController:vcRegister animated:YES];
}

//6. 实现代理方法
- (void) input:(NSString *)text
{
    _textField.text = text;
    _textField01.text = text;
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
