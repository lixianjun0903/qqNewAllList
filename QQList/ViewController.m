//
//  ViewController.m
//  QQList
//
//  Created by 李李贤军 on 15/7/9.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
{
}
@property(nonatomic,strong)NSMutableArray * dataArray;
@property(nonatomic,strong)NSDictionary * dic;
@end
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel * lable =[[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 40)];
    lable.text = self.str;
    [self.view addSubview:lable];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
