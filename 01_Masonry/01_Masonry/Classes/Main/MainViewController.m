//
//  MainViewController.m
//  01_Masonry
//
//  Created by nixinsheng on 16/5/29.
//  Copyright © 2016年 AsiaInfo. All rights reserved.
//

#import "MainViewController.h"
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"主页";
    // Do any additional setup after loading the view.
    //self.view.backgroundColor = [UIColor grayColor];
    WS(ws);
    //基础布局
    UIView* sv = [UIView new];
    [sv showPlaceHolder];
    sv.backgroundColor = [UIColor redColor];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(ws.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
