//
//  RSCircleButton.m
//  Task7
//
//  Created by Kirill Kaveryn on 3.07.21.
//

#import "RSCircleButton.h"
#import "RSColor.h"

@implementation RSCircleButton

-(instancetype)initWithDiameter:(CGFloat)dim andTitle:(NSString *)title {
    self = [super initWithFrame:CGRectMake(0, 0, dim, dim)];
    if (self) {
        self.layer.cornerRadius = dim / 2;
        self.layer.borderWidth = 1.5;
        self.layer.borderColor = [UIColor colorLittleBoy].CGColor;
        [self setTitle:title forState:UIControlStateNormal];
        [self.titleLabel setFont: [UIFont systemFontOfSize:24 weight:UIFontWeightSemibold]];
        [self setTitleColor: [UIColor colorLittleBoy] forState:UIControlStateNormal];
        [self clipsToBounds];
    }
    return self;
}

@end
