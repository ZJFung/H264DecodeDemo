//
//  ZJSecondViewController.m
//  H264DecodeDemo
//
//  Created by ZJ on 2018/9/26.
//  Copyright © 2018年 ZJ. All rights reserved.
//

#import "ZJSecondViewController.h"
#import "ZJH264Decoder.h"

@interface ZJSecondViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *displayImgView;

@property (nonatomic, strong) ZJH264Decoder *h264Decoder;

@end

@implementation ZJSecondViewController

- (ZJH264Decoder *)h264Decoder {
    if (_h264Decoder == nil) {
        _h264Decoder = [[ZJH264Decoder alloc] init];
    }
    
    return _h264Decoder;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startClick:(UIButton *)sender {
    sender.enabled = false;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.h264Decoder decodeFile:@"mtv" fileExt:@"h264" andDisplayView:self.displayImgView completion:^{
            dispatch_async(dispatch_get_main_queue(), ^{
                sender.enabled = true;
            });
        }];
    });
}


@end
