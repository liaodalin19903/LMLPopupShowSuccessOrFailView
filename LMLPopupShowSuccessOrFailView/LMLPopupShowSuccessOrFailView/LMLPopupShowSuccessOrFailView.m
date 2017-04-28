//
//  LMLPopupShowSuccessOrFailView.m
//  LMLPopupShowSuccessOrFailView
//
//  Created by ldl on 2017/4/28.
//  Copyright © 2017年 liaomalin. All rights reserved.
//

#import "LMLPopupShowSuccessOrFailView.h"

@interface LMLPopupShowSuccessOrFailView ()

@property (weak, nonatomic) IBOutlet UIView *backAlphaView;  // 909090  0.3
@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *contentBtn;


@property (weak, nonatomic) IBOutlet UIView *showView;

@end

@implementation LMLPopupShowSuccessOrFailView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - init

- (void)awakeFromNib {

    [super awakeFromNib];
    
    [self initUI];
}

- (void)initUI {
    
    
    self.backAlphaView.alpha = 0; // 0->0.3
    self.showView.transform = CGAffineTransformMakeScale(0, 0);
    
    self.hidden = YES;
    
    UIWindow *keyWindow = [[UIApplication sharedApplication].delegate window];
    [keyWindow addSubview:self];
}



#pragma mark - actions

- (IBAction)actionForBtn:(UIButton *)sender {
    
    self.block(sender.titleLabel.text);
}

- (void)showSelf {
    
    if (self.superview) {
        [self.superview bringSubviewToFront:self];
    }
    
    self.hidden =NO;
    self.showView.alpha = 1;
    [UIView animateWithDuration:0.3 animations:^{
        self.backAlphaView.alpha = 0.3;
    }];
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 / 0.8 options:0 animations:^{
     
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
     
        self.showView.transform = CGAffineTransformIdentity;
     
     } completion:^(BOOL finished) {
         
     }];
}

- (void)hideSelf {
    
    
    [UIView animateWithDuration:0.3 animations:^{
        self.backAlphaView.alpha = 0;
    }];
    
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1/0.8 options:0 animations:^{
        
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        
        self.showView.transform = CGAffineTransformMakeScale(0.01, 0.01);
        self.showView.alpha = 0;
        
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
    
    /*
    [UIView animateWithDuration:0.3 animations:^{
        self.showView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    }completion:^(BOOL finished) {
        self.hidden = YES;
    }];*/
}

- (IBAction)clickBackAlphaView:(id)sender {

    [self hideSelf];
}

#pragma mark - setter

- (void)setSuccessOrFailType:(LMLPopupShowSuccessOrFailViewEnum)successOrFailType {

    _successOrFailType = successOrFailType;
    
    // 成功
    if (successOrFailType == 0) {
        
        _iconImg.image = [UIImage imageNamed:@"lml_pop_success"];
    }
    // 失败
    else {
        _iconImg.image = [UIImage imageNamed:@"lml_pop_fail"];
    }
}


- (void)setTitle:(NSString *)title {

    _title = title;
    self.contentLabel.text = _title;
}

- (void)setDetailTitle:(NSString *)detailTitle {

    _detailTitle = detailTitle;
    
    [_contentBtn setTitle:_detailTitle forState:UIControlStateNormal];
}


@end
