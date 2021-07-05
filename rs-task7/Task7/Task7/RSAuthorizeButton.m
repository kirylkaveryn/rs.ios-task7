//
//  RSAuthorizeButton.m
//  Task7
//
//  Created by Kirill Kaveryn on 3.07.21.
//

#import "RSAuthorizeButton.h"
#import "RSColor.h"

@implementation RSAuthorizeButton

-(instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, 156, 42); //defaul size
        [self.titleLabel setFont: [UIFont systemFontOfSize:20 weight:UIFontWeightSemibold]];
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorLittleBoy] forState:UIControlStateNormal];
        self.layer.borderColor = [UIColor colorLittleBoy].CGColor;
        self.layer.borderWidth = 2.0;
        self.layer.cornerRadius = 10.0;
        [self clipsToBounds];
        
        UIImage *personEmpty = [UIImage imageNamed:@"person2x"];
        UIImage *personFill = [UIImage imageNamed:@"person2xfill"];

        [[self imageView] setContentMode:UIViewContentModeScaleAspectFit];
        self.imageEdgeInsets = UIEdgeInsetsMake(13, 0, 13, 8);
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 8);
        
        [self setImage:personEmpty forState:UIControlStateNormal];
        
        // highlited state for authorize button
        [self setImage:personFill forState:UIControlStateHighlighted];
        [self setTitleColor: [self.currentTitleColor colorWithAlphaComponent:0.4] forState:UIControlStateHighlighted];
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted {
    
    UIColor *color = [UIColor colorLittleBoy];
    
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        self.backgroundColor = [color colorWithAlphaComponent:0.2];
    }
    else {
        self.backgroundColor = [UIColor whiteColor];
    }
}

@end
