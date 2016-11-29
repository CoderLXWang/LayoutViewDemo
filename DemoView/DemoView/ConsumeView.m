//
//  ConsumeView.m
//  DemoView
//
//  Created by sharejoy_lx on 16-11-28.
//  Copyright © 2016年 wlx. All rights reserved.
//

#import "ConsumeView.h"
#import "Masonry.h"
#import "UIColor+Hex.h"
#import "SJUIKit.h"

@interface ConsumeView ()

@property (nonatomic, weak) UIView *bgView; //取代self

@property (nonatomic, weak) UIView *summaryView;

@property (nonatomic, weak) UIView *expendBgView;
@property (nonatomic, weak) UIView *topView;
@property (nonatomic, weak) UIView *midView;

@end

@implementation ConsumeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configView];
    }
    return self;
}

- (void)configView {
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self.expendBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView).offset(7.5);
        make.left.equalTo(self.bgView).offset(15);
        make.right.equalTo(self.bgView).offset(-15);
    }];
    
    [self.summaryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView).offset(7.5);
        make.left.equalTo(self.bgView).offset(15);
        make.right.equalTo(self.bgView).offset(-15);
    }];
}

- (void)setExpend:(BOOL)expend {
    
    _expend = expend;
    if (expend) {
        self.expendBgView.hidden = NO;
        [UIView animateWithDuration:0.9 animations:^{
            self.expendBgView.alpha = 1.0;
        }];
        self.summaryView.hidden = YES;
        
        [self.bgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
            make.bottom.equalTo(self.expendBgView).offset(7.5);
        }];
    } else {
        self.expendBgView.hidden = YES;
        self.expendBgView.alpha = 0;
        self.summaryView.hidden = NO;
        
        [self.bgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
            make.bottom.equalTo(self.summaryView).offset(7.5);
            make.height.mas_equalTo(60);
        }];
    }
}

- (UIView *)bgView {
    if (!_bgView) {
        UIView *bgView = [[UIView alloc] init];
        _bgView = bgView;
        
        [self addSubview:bgView];
    }
    return _bgView;
}

- (UIView *)summaryView {
    if (!_summaryView) {
        UIView *summaryView = [[UIView alloc] init];
        _summaryView = summaryView;
        _summaryView.backgroundColor = [UIColor colorWithHexString:@"f0f0f0"];
        _summaryView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _summaryView.layer.borderWidth = 0.5;
        _summaryView.layer.masksToBounds = YES;
        [self.bgView addSubview:summaryView];
        
        UILabel *timeLabel = [SJUIKit labelWithText:@"11:00" fontSize:12];
        [summaryView addSubview:timeLabel];
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(summaryView).offset(10);
            make.centerY.equalTo(summaryView);
        }];
        
        UILabel *tableNoLabel = [SJUIKit labelWithText:@"2号桌" fontSize:14];
        tableNoLabel.font = [UIFont boldSystemFontOfSize:12];
        [summaryView addSubview:tableNoLabel];
        [tableNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(timeLabel).offset(0);
            make.left.equalTo(timeLabel.mas_right).offset(10);
        }];
        
        NSString *paymentStr = @"现金收款";
        
        UILabel *paymentLabel = [SJUIKit labelWithText:[NSString stringWithFormat:@"%@¥%@", paymentStr, @"100"] fontSize:12];
        paymentLabel.font = [UIFont boldSystemFontOfSize:12];
        [summaryView addSubview:paymentLabel];
        [paymentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(summaryView);
            make.left.equalTo(tableNoLabel.mas_right).offset(10);
        }];
        
        UIImageView *arrowImg = [SJUIKit imageViewWithImage:[UIImage imageNamed:@"record_downArrow"]];
        [summaryView addSubview:arrowImg];
        [arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(summaryView);
            make.right.equalTo(summaryView).offset(-10);
            make.size.mas_equalTo(CGSizeMake(22/1.5, 13/1.5));
        }];
        
        NSString *imgStr = @"record_success";
        NSString *stateStr = @" ";
        UIColor *stateColor;
        
        UIImageView *stateImg = [SJUIKit imageViewWithImage:[UIImage imageNamed:imgStr]];
        [summaryView addSubview:stateImg];
        [stateImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(timeLabel).offset(-7.5);
            make.right.equalTo(arrowImg.mas_left).offset(-25);
            make.size.mas_equalTo(CGSizeMake(38/3, 38/3));
        }];
        
        UILabel *stateLabel = [SJUIKit labelWithTextColor:stateColor numberOfLines:1 text:stateStr fontSize:12];
        [summaryView addSubview:stateLabel];
        [stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(stateImg);
            make.top.equalTo(stateImg.mas_bottom).offset(5);
        }];
        
        if ([stateStr isEqualToString:@" "]) {
            [stateImg mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(timeLabel).offset(0);
            }];
        }
        
        _summaryView.hidden = NO;
    }
    return _summaryView;
}

- (UIView *)expendBgView {
    if (!_expendBgView) {
        UIView *expendBgView = [[UIView alloc] init];
        _expendBgView = expendBgView;
        _expendBgView.backgroundColor = [UIColor colorWithHexString:@"f0f0f0"];
        _expendBgView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _expendBgView.layer.borderWidth = 0.5;
        _expendBgView.layer.masksToBounds = YES;
        
        [self.bgView addSubview:expendBgView];
        
        [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(expendBgView).offset(0);
        }];
        
        [self.midView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(expendBgView).offset(0);
            make.top.equalTo(self.topView.mas_bottom).offset(10);
            make.bottom.equalTo(expendBgView).offset(-30);
        }];
        
        UIImageView *upArrowImg = [SJUIKit imageViewWithImage:[UIImage imageNamed:@"record_upArrow"]];
        [expendBgView addSubview:upArrowImg];
        [upArrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(expendBgView);
            make.bottom.equalTo(expendBgView).offset(-15);
            make.size.mas_equalTo(CGSizeMake(22/1.5, 13/1.5));
        }];
        
        expendBgView.hidden = YES;
    }
    return _expendBgView;
}

- (UIView *)topView {
    if (!_topView) {
        UIView *topView = [[UIView alloc] init];
        _topView = topView;
        [_expendBgView addSubview:topView];
        
        UILabel *timeLabel = [SJUIKit labelWithText:@"11:00" fontSize:14];
        [_topView addSubview:timeLabel];
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(topView).offset(15);
            make.left.equalTo(topView).offset(10);
        }];
        
        UILabel *tableNoLabel = [SJUIKit labelWithText:@"2号桌" fontSize:14];
        tableNoLabel.font = [UIFont boldSystemFontOfSize:14];
        [_topView addSubview:tableNoLabel];
        [tableNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(timeLabel).offset(0);
            make.centerX.equalTo(topView);
        }];
        
        NSString *imgStr = @"record_success";
        NSString *stateStr = @" ";
        UIColor *stateColor;
        
        UIImageView *stateImg = [SJUIKit imageViewWithImage:[UIImage imageNamed:imgStr]];
        [topView addSubview:stateImg];
        [stateImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(timeLabel).offset(0);
            make.right.equalTo(topView).offset(-29);
            make.size.mas_equalTo(CGSizeMake(38/3, 38/3));
        }];
        
        UILabel *stateLabel = [SJUIKit labelWithTextColor:stateColor numberOfLines:1 text:stateStr fontSize:12];
        [topView addSubview:stateLabel];
        [stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(stateImg);
            make.top.equalTo(stateImg.mas_bottom).offset(5);
        }];
        
        UILabel *checkNoLabel = [SJUIKit labelWithText:[NSString stringWithFormat:@"买单号：%@", @"12376534234324"] fontSize:14];
        [topView addSubview:checkNoLabel];
        [checkNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(timeLabel).offset(0);
            make.top.equalTo(timeLabel.mas_bottom).offset(20);
        }];
        
        
        UILabel *shangbinNoLabel = [SJUIKit labelWithText:[NSString stringWithFormat:@"上宾号：%@", @"32574539"] fontSize:14];
        [topView addSubview:shangbinNoLabel];
        [shangbinNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(timeLabel).offset(0);
            make.top.equalTo(checkNoLabel.mas_bottom).offset(5);
            make.bottom.equalTo(topView.mas_bottom).offset(-10);
        }];

        
    }
    return _topView;
}


- (UIView *)midView {
    if (!_midView) {
        UIView *midView = [[UIView alloc] init];
        _midView = midView;
        [_expendBgView addSubview:midView];
        
        UIView *borderView = [[UIView alloc] init];
        borderView.layer.borderColor = [UIColor blackColor].CGColor;
        borderView.layer.borderWidth = 1;
        [midView addSubview:borderView];
        [borderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(midView).offset(10);
            make.left.equalTo(midView).offset(15);
            make.right.equalTo(midView).offset(-15);
            make.height.mas_equalTo(50);
        }];


        NSString *realPayAmount = @"100";
        NSMutableAttributedString *realPaystr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"实际收款：¥%@", realPayAmount]];
        [realPaystr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#E32120"] range:NSMakeRange(5, realPayAmount.length + 1)];

        
        UILabel *realPayLabel = [[UILabel alloc]init];
        realPayLabel.font = [UIFont systemFontOfSize:17];
        realPayLabel.attributedText = realPaystr;
        
        [borderView addSubview:realPayLabel];
        [realPayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(borderView);
            make.left.equalTo(borderView).offset(15);
        }];
        
        NSString *paymentStr = @"现金";
        
        UILabel *paymentLabel = [SJUIKit labelWithText:paymentStr fontSize:17];
        [borderView addSubview:paymentLabel];
        [paymentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(borderView);
            make.right.equalTo(borderView).offset(-15);
        }];
        
        NSString *amountStr = @"100";
        NSMutableAttributedString *amountAttStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"账单消费 ¥%@", amountStr]];
        [amountAttStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#E32120"] range:NSMakeRange(5, amountStr.length + 1)];
        
        UILabel *amountLabel = [[UILabel alloc]init];
        amountLabel.attributedText = amountAttStr;
        amountLabel.font = [UIFont systemFontOfSize:15];
        [borderView addSubview:amountLabel];
        [amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(borderView).offset(15);
            make.top.equalTo(borderView.mas_bottom).offset(25);
            make.bottom.equalTo(midView).offset(-10);
        }];
        
        
        UILabel *stafflabel = [SJUIKit labelWithText:[NSString stringWithFormat:@"操作员%@", @"小鸣"] fontSize:15];
        [borderView addSubview:stafflabel];
        [stafflabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(borderView).offset(-15);
            make.top.equalTo(amountLabel).offset(0);
        }];
        
        
    }
    return _midView;
}




@end
