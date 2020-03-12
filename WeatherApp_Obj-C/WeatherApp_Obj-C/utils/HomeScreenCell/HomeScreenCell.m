//
//  HomeScreenCell.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 27/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "HomeScreenCell.h"
#import "AppCustomDimens.h"

@implementation HomeScreenCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundImage.layer.cornerRadius = cellCornerRadius;
    self.colorBackground.layer.cornerRadius = cellCornerRadius;
}

+ (instancetype)loadFromNib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
