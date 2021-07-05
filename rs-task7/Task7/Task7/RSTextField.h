//
//  RSLoginTextField.h
//  Task7
//
//  Created by Kirill Kaveryn on 3.07.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSTextField : UITextField

typedef NS_ENUM(NSInteger, FieldStatement) {
    ready,
    error,
    success,
};

@property (nonatomic, readonly) FieldStatement currentState;

-(instancetype)initWithPlaceholder:(NSString *)placeholder;

-(void)setStateForTextField: (FieldStatement) statement;

@end

NS_ASSUME_NONNULL_END
