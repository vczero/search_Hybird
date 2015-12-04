//
//  ViewController.m
//  search
//
//  Created by lihua on 15/12/4.
//  Copyright (c) 2015年 lihua. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIWebView               * _wb;
    UIActivityIndicatorView *_act;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(!_wb){
        _wb = [[UIWebView alloc]init];
    }
    self.title = @"Hybird App";
    
    float width = [[UIScreen mainScreen]bounds].size.width;
    float height = [[UIScreen mainScreen]bounds].size.height;
    
    _wb.frame = CGRectMake(0, 0, width, height);
    NSString *path = [NSString stringWithFormat:@"http://vczero.github.io/search/html/index.html"];
    NSURL *url = [[NSURL alloc]initWithString:path];
    NSURLRequest *urlReq = [[NSURLRequest alloc]initWithURL:url];
    [_wb loadRequest:urlReq];
    

    
    _wb.delegate = self;

    [self.view addSubview:_wb];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    if(!_act){
        _act = [[UIActivityIndicatorView alloc]init];
        _act.color = [UIColor blueColor];
        _act.center = self.view.center;
        [self.view addSubview:_act];
    }
    if(_act.isAnimating){
        return;
    }
    [_act startAnimating];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [_act stopAnimating];
    NSString *location =[webView stringByEvaluatingJavaScriptFromString:@"document.location.href"];
    if([location rangeOfString:@"douban.com"].location != NSNotFound){
        UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(selectLeftAction:)];
        self.navigationItem.leftBarButtonItem = leftButton;
    }else{
        self.navigationItem.leftBarButtonItem = nil;
    }
}

-(void)selectLeftAction:(id)sender{
    NSString *location =[_wb stringByEvaluatingJavaScriptFromString:@"document.location.href"];
    if ([location rangeOfString:@"movie"].location != NSNotFound) {
        NSString *str = @"document.location.href='http://vczero.github.io/search/html/index.html#/movie'";
        [_wb stringByEvaluatingJavaScriptFromString:str];
    }
    
    if ([location rangeOfString:@"music"].location != NSNotFound) {
        NSString *str = @"document.location.href='http://vczero.github.io/search/html/index.html#/music'";
        [_wb stringByEvaluatingJavaScriptFromString:str];
    }
}

@end
