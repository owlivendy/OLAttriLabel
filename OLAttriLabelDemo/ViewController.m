//
//  ViewController.m
//  OLAttriLabelDemo
//
//  Created by ctkj108-xx on 16/3/23.
//  Copyright © 2016年 ctkj108-xx. All rights reserved.
//

#import "ViewController.h"
#import "OLAttriLabel.h"
#import <objc/runtime.h>

@interface ViewController ()
{
    OLAttriLabel *attriLb;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    attriLb = [[OLAttriLabel alloc] initWithFrame:(CGRect){30,30,200,200}];
    attriLb.numberOfLines = 10;
    
    attriLb.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:attriLb];
    
    //普通文本
    [attriLb appendText:@"hello ~ 这是一段测试core text的文本\n"];
    //富文本
    NSString *txt = @"IOS 9.3 中调色温的功能很赞！";
    NSDictionary *attri = @{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:30.f]};
    NSAttributedString *attriString = [[NSAttributedString alloc] initWithString:txt
                                                                      attributes:attri];
    [attriLb appendAttriText:attriString];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
