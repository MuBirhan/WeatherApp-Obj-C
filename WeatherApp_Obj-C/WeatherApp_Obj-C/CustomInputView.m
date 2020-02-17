//
//  CustomInputView.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 17/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "CustomInputView.h"

@implementation CustomInputView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"CustomInputView" owner:self options:nil];
        [self.userInput.layer setCornerRadius:25];
        [self.userInput.layer setBorderColor:[UIColor grayColor].CGColor];
        [self addSubview:self.view];
    }
    return self;
}

@end
