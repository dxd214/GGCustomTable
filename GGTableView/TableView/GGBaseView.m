//
//  GGBaseView.m
//  GGTableView
//
//  Created by __无邪_ on 15/10/11.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "GGBaseView.h"

@implementation GGBaseView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.defaultView = [[GGTableDefaultView alloc] initWithFrame:self.bounds];
        [self.defaultView setHidden:YES];
        [self addSubview:self.defaultView];
    }
    return self;
}
@end
