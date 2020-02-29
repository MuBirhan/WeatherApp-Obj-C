//
//  HomeScreenCell.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 27/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "HomeScreenCell.h"

@implementation HomeScreenCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 10;
}

+ (instancetype)loadFromNib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
