//
//  RSLabel.m
//  Task7
//
//  Created by Kirill Kaveryn on 3.07.21.
//

#import "RSLabel.h"
#import "RSColor.m"

@interface RSLabel()

@property (nonatomic, readwrite) LabelFrameStatement currentState;

@end

@implementation RSLabel

-(void)setStateForLabelFrame: (LabelFrameStatement) statement {
    
    switch (statement) {
        case noneFrame:
            self.layer.borderColor = [UIColor clearColor].CGColor;
            self.currentState = noneFrame;
            break;
        case errorFrame:
            self.layer.borderColor = [UIColor colorVenetianRed].CGColor;
            self.currentState = errorFrame;
            break;
        case successFrame:
            self.layer.borderColor = [UIColor colorTurquosieGreen].CGColor;
            self.currentState = successFrame;
            break;
    }
}

-(void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = {0, 0, 68, 0};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
