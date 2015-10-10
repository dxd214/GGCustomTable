//
//  GGTableViewCell.m
//  GGTableView
//
//  Created by __无邪_ on 15/10/11.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "GGTableViewCell.h"

@implementation GGTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}



- (void)configureCellWithName:(NSString *)name{
    [self.textLabel setText:name];
    
    CGFloat textHeight = 100;
    
    CGRect frame = self.frame;
    frame.size.height = textHeight;
    
    [self setFrame:frame];
    
}



@end
