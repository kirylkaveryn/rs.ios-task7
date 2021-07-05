//
//  RSLabel.h
//  Task7
//
//  Created by Kirill Kaveryn on 3.07.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSLabel : UILabel

typedef NS_ENUM(NSInteger, LabelFrameStatement) {
    noneFrame,
    errorFrame,
    successFrame,
};

@property (nonatomic, readonly) LabelFrameStatement currentState;

-(void)setStateForLabelFrame: (LabelFrameStatement) statement;
-(void)drawTextInRect:(CGRect)rect;

@end

NS_ASSUME_NONNULL_END
