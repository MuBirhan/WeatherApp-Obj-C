//
//  CustomInputView.m
//  WeatherApp_Obj-C
//
//  Created by Muradasil Birhan on 17/02/2020.
//  Copyright © 2020 RodeApps. All rights reserved.
//

#import "CustomInputView.h"

@implementation CustomInputView

- (void)drawRect:(CGRect)rect {
    
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [[[NSBundle mainBundle] loadNibNamed:@"CustomInputView" owner:self options:nil] firstObject];
        [self.userInput setBorderStyle:UITextBorderStyleNone];
        self.userInput.layer.borderWidth = 0.5;
        self.userInput.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.userInput.layer.masksToBounds = YES;
        self.userInput.layer.cornerRadius = 25;
        [self addSubview:self.view];
        NSDictionary *dict = @{
            @"view" : self.view
        };
        NSArray *array = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view]-0-|" options:0 metrics:nil views:dict];
        [self addConstraints:array];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.label.text = self.labelName;
    self.userInput.placeholder = self.inputPlaceholder;
    if (self.isPassword) {
        self.userInput.secureTextEntry = true;
    } else {
        self.userInput.secureTextEntry = false;
    }
}
@end
