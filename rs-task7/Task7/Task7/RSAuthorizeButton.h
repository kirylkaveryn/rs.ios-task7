//
//  RSAuthorizeButton.h
//  Task7
//
//  Created by Kirill Kaveryn on 3.07.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSAuthorizeButton : UIButton

-(instancetype)initWithTitle:(NSString *)title;
-(void)setHighlighted:(BOOL)highlighted;

@end

NS_ASSUME_NONNULL_END
