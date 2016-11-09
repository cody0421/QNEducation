//
//  QNBaseTabbarController.m
//  QNEducation
//
//  Created by APPLE on 2016/11/8.
//  Copyright © 2016年 启能教育. All rights reserved.
//

#import "QNBaseTabbarController.h"

@interface QNBaseTabbarController ()

@end

@implementation QNBaseTabbarController



- (id)initWithCoder:(NSCoder *)aDecoder{

    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;

        
    }
    
    return self;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleDefault;
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
