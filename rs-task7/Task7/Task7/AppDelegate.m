//
//  AppDelegate.m
//  Task7
//
//  Created by Kirill Kaveryn on 2.07.21.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    UIWindow *window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    window.backgroundColor = [UIColor whiteColor];
    
    // создаем рутовый контроллер и меняем ему цвет
    ViewController *rootViewController = [[ViewController alloc] init];
//    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    ViewController *rootViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"ViewController"];
    rootViewController.view.backgroundColor = [UIColor whiteColor];
    
    // назначем рутовый вью контроллер окну
    window.rootViewController = rootViewController;
    
    // назначаем аппделегату окно и делаем его keyAndVisible
    self.window = window;
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
