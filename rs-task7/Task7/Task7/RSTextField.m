//
//  RSLoginTextField.m
//  Task7
//
//  Created by Kirill Kaveryn on 3.07.21.
//

#import "RSTextField.h"
#import "RSColor.m"

@interface RSTextField()

@property (nonatomic, readwrite) FieldStatement currentState;

@end

@implementation RSTextField

-(instancetype)initWithPlaceholder:(NSString *)placeholder {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, 100, 30);
        [self setFont: [UIFont systemFontOfSize:16]];
        self.textColor = [UIColor blackColor];
        [self setPlaceholder:placeholder];
        self.layer.borderColor = [UIColor colorBlackCoral].CGColor;
        self.layer.borderWidth = 1.5;
        self.layer.cornerRadius = 5.0;
        [self setBorderStyle:UITextBorderStyleRoundedRect];
        self.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.autocorrectionType = UITextAutocorrectionTypeNo;
        [self becomeFirstResponder];
        self.clearsOnBeginEditing = NO;
        
    }
    return self;
}


-(void)setStateForTextField: (FieldStatement) statement {
    
    switch (statement) {
        case ready:
            self.layer.borderColor = [UIColor colorBlackCoral].CGColor;
            self.currentState = ready;
            break;
        case error:
            self.layer.borderColor = [UIColor colorVenetianRed].CGColor;
            self.currentState = error;
            break;
        case success:
            self.layer.borderColor = [UIColor colorTurquosieGreen].CGColor;
            self.currentState = success;
            break;
    }
}

@end
