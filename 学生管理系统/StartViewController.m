//
//  StartViewController.m
//  学生管理系统
//
//  Created by 郭红乐 on 2020/7/28.
//  Copyright © 2020 无. All rights reserved.
//

#import "StartViewController.h"
#import "LandViewController.h"
@interface StartViewController ()

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"开机界面.jpg"]];
     img.frame =  self.view.bounds;
    img.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:img atIndex:0];
     
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"开机界面.jpg"]]];
    
    UILabel *label1 = [[UILabel alloc] init];
    [self.view addSubview:label1];
    label1.text = @"郭敏慧";
    label1.textColor = [UIColor whiteColor];
    //UIColor(red: 0.83, green: 0.64, blue: 0.56, alpha: 1.00)
    // UIColor(red: 0.16, green: 0.56, blue: 0.99, alpha: 1.00)
    //UIColor(red: 0.96, green: 0.72, blue: 0.68, alpha: 1.00)
    //label1.textColor = [UIColor colorWithRed:0.83 green:0.64 blue:0.56 alpha:1.00];
    label1.frame = CGRectMake(13, 378, 414, 60);
    label1.textAlignment = NSTextAlignmentCenter;
    label1.font = [UIFont fontWithName:@"Bangla Sangam MN" size:39];
    
    UILabel *label = [[UILabel alloc] init];
    [self.view addSubview:label];
    label.text = @"学生管理系统";
    label.textColor = [UIColor whiteColor];
    
    //UIColor(red: 0.94, green: 0.56, blue: 0.58, alpha: 1.00)UIColor(red: 0.21, green: 0.57, blue: 0.80, alpha: 1.00)UIColor(red: 0.21, green: 0.57, blue: 0.80, alpha: 1.00)UIColor(red: 0.95, green: 0.86, blue: 0.51, alpha: 1.00)
    label.textColor = [UIColor colorWithRed:0.83 green:0.64 blue:0.56 alpha:1.00];
    label.frame = CGRectMake(10, 465, 414, 40);
    //label.frame = CGRectMake(10, 485, 414, 40);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"Bangla Sangam MN" size:36];
    //label.font = [UIFont systemFontOfSize:35];
    
     
     [self performSelector:@selector(changeView) withObject:self afterDelay:2];
     
}

- (void)changeView {
    UIWindow *window = self.view.window;
    LandViewController *main = [[LandViewController alloc] init];

    //添加一个缩放效果
    main.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
    [UIView animateWithDuration:0.1 animations:^{
        main.view.transform = CGAffineTransformIdentity;
    }];

    window.rootViewController = main;
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
