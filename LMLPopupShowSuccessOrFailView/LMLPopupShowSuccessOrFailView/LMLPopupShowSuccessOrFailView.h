//
//  LMLPopupShowSuccessOrFailView.h
//  LMLPopupShowSuccessOrFailView
//
//  Created by ldl on 2017/4/28.
//  Copyright © 2017年 liaomalin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    PopupSuccess = 0,
    PopupFail = 1,
    
} LMLPopupShowSuccessOrFailViewEnum;

typedef void(^ClickLMLPopupViewBtnBlock)(NSString *);


@interface LMLPopupShowSuccessOrFailView : UIView

@property (nonatomic, assign) LMLPopupShowSuccessOrFailViewEnum successOrFailType; // 0成功 1失败

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detailTitle;  // 内容

@property (nonatomic, copy) ClickLMLPopupViewBtnBlock block;


- (void)showSelf;
- (void)hideSelf;

@end
