//
//  RSColor.m
//  Task7
//
//  Created by Kirill Kaveryn on 3.07.21.
//
#import <UIKit/UIKit.h>

@interface UIColor (RSColor)

+(UIColor *)colorLittleBoy;
+(UIColor *)colorTurquosieGreen;
+(UIColor *)colorVenetianRed;
+(UIColor *)colorBlackCoral;

@end


@implementation UIColor (RSColor)

+(UIColor *)colorLittleBoy {
    return [UIColor colorNamed:@"LittleBoyBlue"];
}
+(UIColor *)colorTurquosieGreen {
    return [UIColor colorNamed:@"TurquosieGreen"];
}
+(UIColor *)colorVenetianRed {
    return [UIColor colorNamed:@"VenetianRed"];
}
+(UIColor *)colorBlackCoral {
    return [UIColor colorNamed:@"BlackCoral"];
}

@end
