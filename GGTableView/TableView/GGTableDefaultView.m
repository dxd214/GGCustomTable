//
//  GGTableDefaultView.m
//  GGTableView
//
//  Created by __无邪_ on 15/10/11.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "GGTableDefaultView.h"

@interface GGTableDefaultView ()
@property (nonatomic ,strong) UILabel *tipLabel;
@end

@implementation GGTableDefaultView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.tipLabel = [[UILabel alloc] initWithFrame:frame];
        [self.tipLabel setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        [self.tipLabel setTextColor:[UIColor blueColor]];
//        [self.tipLabel setBackgroundColor:[UIColor color_f2f2f2]];
//        [self.tipLabel setTextColor:[UIColor colorFromHexRGB:@"666666"]];
        [self.tipLabel setFont:[UIFont fontWithName:@"Arial" size:15.0f]];
        [self.tipLabel setTextAlignment:NSTextAlignmentCenter];
        [self.tipLabel setText:@"当前没有内容"];
        
        [self.tipLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:self.tipLabel];
    }
    return self;
}

- (void)setTipValue:(NSString *)tip{
    [self.tipLabel setText:tip];
}

@end
