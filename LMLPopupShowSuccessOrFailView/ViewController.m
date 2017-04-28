//
//  ViewController.m
//  LMLPopupShowSuccessOrFailView
//
//  Created by ldl on 2017/4/28.
//  Copyright © 2017年 liaomalin. All rights reserved.
//

#import "ViewController.h"
#import "LMLPopupShowSuccessOrFailView.h"

@interface ViewController ()
{
    LMLPopupShowSuccessOrFailView *show_view;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* 失败 */
    
    show_view = [[NSBundle mainBundle] loadNibNamed:@"LMLPopupShowSuccessOrFailView" owner:self options:nil].firstObject;
    show_view.title = @"未申请";
    show_view.successOrFailType = PopupFail; // 失败
    show_view.detailTitle = @" 了解原因？";
    show_view.block = ^(NSString *reStr) {
        NSLog(@"%@", reStr);
    };
    
    /* 成功 */
    /*
    show_view = [[NSBundle mainBundle] loadNibNamed:@"LMLPopupShowSuccessOrFailView" owner:self options:nil].firstObject;
    show_view.title = @"申请通过";
    show_view.successOrFailType = PopupSuccess; // 失败
    show_view.detailTitle = @" 系统将会在1~2小时内发送到您的账号";
    show_view.block = ^(NSString *reStr) {
        NSLog(@"%@", reStr);
    };*/
}
- (IBAction)showPop:(UIButton *)sender {
    [show_view showSelf];
}

@end
