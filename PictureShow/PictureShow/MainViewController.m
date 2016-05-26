//
//  MainViewController.m
//  PictureShow
//
//  Created by nixinsheng on 16/5/19.
//  Copyright © 2016年 AsiaInfo. All rights reserved.
//

#import "MainViewController.h"
#import "UIImageView+WebCache.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Center Of The Show.";
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    // Do any additional setup after loading the view from its nib.
    __block UIProgressView *pv;
    __block UILabel* lab;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://p1.pichost.me/i/40/1639665.png"] placeholderImage:nil options:SDWebImageCacheMemoryOnly progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        pv = [[UIProgressView alloc]initWithProgressViewStyle:(UIProgressViewStyleDefault)];
        pv.frame = CGRectMake(0, 0, 400, 20);
        pv.center = self.view.center;
        NSLog(@"%d,%d",receivedSize,expectedSize);
        float currentProgress = (float)receivedSize/(float)expectedSize;
        lab.frame = CGRectMake(0, 0, 100, 100);
        lab.text = [NSString stringWithFormat:@"%f",currentProgress];
        lab.textColor = [UIColor redColor];
        pv.progress = currentProgress;
        [self.imageView addSubview:pv];
        [self.imageView addSubview:lab];

        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [pv removeFromSuperview];
        pv=nil;
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
