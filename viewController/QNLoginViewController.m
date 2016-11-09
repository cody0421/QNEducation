//
//  QNLoginViewController.m
//  QNEducation
//
//  Created by APPLE on 2016/11/8.
//  Copyright © 2016年 启能教育. All rights reserved.
//

#import "QNLoginViewController.h"

@interface QNLoginViewController ()
@property (weak, nonatomic) IBOutlet UIView *loginBackView;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UITextField *studyNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *findBtn;
@property (weak, nonatomic) IBOutlet UIButton *autoLoginBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginBackTopLayout;
@property (weak, nonatomic) IBOutlet UIView *textBackView1;
@property (weak, nonatomic) IBOutlet UIView *textBackView2;

@end

@implementation QNLoginViewController{

    CGFloat _oldTopLayout;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self uploadUI];
    

//    UIColor *color =self.loginBtn.backgroundColor;
//    const CGFloat *components = CGColorGetComponents(color.CGColor);
//    NSLog(@"Red: %f", components[0]);
//    NSLog(@"Green: %f", components[1]);
//    NSLog(@"Blue: %f", components[2]);
    
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];

}

- (void)uploadUI{
    
    _oldTopLayout = self.loginBackTopLayout.constant;

    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"homeBackGroud"]];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    imageView.frame = self.view.bounds;
    [self.view insertSubview:imageView atIndex:0];
    
    self.loginBackView.backgroundColor = [UIColor clearColor];
    
    self.loginBtn.layer.cornerRadius  = 8.0f;
    self.loginBtn.layer.masksToBounds = YES;
    
    self.headerImageView.layer.cornerRadius = CGRectGetWidth(self.headerImageView.frame)/2.0f;
    self.headerImageView.layer.masksToBounds = YES;
    self.headerImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.headerImageView.layer.borderWidth = 4.0f;
    
    self.textBackView1.layer.cornerRadius = 2.0f;
    self.textBackView1.layer.masksToBounds = YES;
    
    self.textBackView2.layer.cornerRadius = 2.0f;
    self.textBackView2.layer.masksToBounds = YES;
    
    
}



#pragma mark - 键盘通知
- (void)keyboardWillHide:(NSNotification *)notification{
    
    NSDictionary * userInfo = notification.userInfo;
    
    NSTimeInterval duration = [userInfo[@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];
    
    self.loginBackTopLayout.constant = _oldTopLayout;
    
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
        self.headerImageView.alpha = 1.0f;

    }];
    
}

- (void)keyboardWillShow:(NSNotification *)notification{
    
    NSDictionary * userInfo = notification.userInfo;
    
    NSTimeInterval duration = [userInfo[@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];
    
    self.loginBackTopLayout.constant = 70.0f;
    
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
        self.headerImageView.alpha = 0.0f;
    }];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Action
- (IBAction)loginAction:(id)sender {
    
    [self.view endEditing:YES];
    
    
    UIStoryboard * mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController * vc = mainStoryboard.instantiateInitialViewController;
    [self showViewController:vc sender:nil];
    
}

#pragma mark - 触摸事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
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
