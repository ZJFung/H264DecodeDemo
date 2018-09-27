//
//  ZJFirstViewController.m
//  H264DecodeDemo
//
//  Created by ZJ on 2018/9/26.
//  Copyright © 2018年 ZJ. All rights reserved.
//

#import "ZJFirstViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "ZJH264Decoder.h"

@interface ZJFirstViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *displayImgView;

@property (nonatomic, strong) AVSampleBufferDisplayLayer *displayLayer;
@property (nonatomic, strong) ZJH264Decoder *h264Decoder;

@end

@implementation ZJFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupSampleBufferDisplayLayer];
    self.h264Decoder = [[ZJH264Decoder alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startClick:(UIButton *)sender {
    sender.enabled = false;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.h264Decoder decodeFile:@"mtv" fileExt:@"h264" andAVSLayer:self.displayLayer completion:^{
            dispatch_async(dispatch_get_main_queue(), ^{
                sender.enabled = true;
            });
        }];
    });
}

- (void)setupSampleBufferDisplayLayer {
    AVSampleBufferDisplayLayer *avslayer = [[AVSampleBufferDisplayLayer alloc] init];
    
    avslayer.bounds = self.displayImgView.bounds;
    avslayer.position = CGPointMake(CGRectGetMidX(self.displayImgView.bounds), CGRectGetMidY(self.displayImgView.bounds));
    avslayer.videoGravity = AVLayerVideoGravityResizeAspect;
//    avslayer.backgroundColor = [[UIColor blackColor] CGColor];
    
    CMTimebaseRef controlTimebase;
    CMTimebaseCreateWithMasterClock(CFAllocatorGetDefault(), CMClockGetHostTimeClock(), &controlTimebase);
    avslayer.controlTimebase = controlTimebase;
    
    CMTimebaseSetRate(avslayer.controlTimebase, 1.0);
    
    self.displayLayer = avslayer;
    
    [self.displayImgView.layer addSublayer:self.displayLayer];
}

@end
