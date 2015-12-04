//
//  AppDelegate.m
//  search
//
//  Created by lihua on 15/12/4.
//  Copyright (c) 2015年 lihua. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (){
    UIWebView               * _wb;
    UIActivityIndicatorView *_act;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    if(!self.window){
        self.window = [[UIWindow alloc]init];
    }
    float width = [[UIScreen mainScreen]bounds].size.width;
    float height = [[UIScreen mainScreen]bounds].size.height;
    
    self.window.frame = CGRectMake(0, 0, width, height);
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    if(!_wb){
        _wb = [[UIWebView alloc]init];
    }
    
    _wb.frame = CGRectMake(0, 20, width, height);
    NSString *path = [NSString stringWithFormat:@"http://vczero.github.io/search/html/index.html"];
    NSURL *url = [[NSURL alloc]initWithString:path];
    NSURLRequest *urlReq = [[NSURLRequest alloc]initWithURL:url];
    [_wb loadRequest:urlReq];
    
    _wb.delegate = self;
    
    [self.window addSubview:_wb];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    if(!_act){
        _act = [[UIActivityIndicatorView alloc]init];
        _act.color = [UIColor blueColor];
        _act.center = self.window.center;
        [self.window addSubview:_act];
    }
    if(_act.isAnimating){
        return;
    }
    
    [_act startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [_act stopAnimating];
}

@end
