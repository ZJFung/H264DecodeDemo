//
//  ZJH264Decoder.h
//  H264DecodeDemo
//
//  Created by ZJ on 2018/9/26.
//  Copyright © 2018年 ZJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

typedef void(^ZJH264DecoderCompletionCallback)(void);

@interface ZJH264Decoder : NSObject

- (void)decodeFile:(NSString*)fileName fileExt:(NSString*)fileExt andAVSLayer:(AVSampleBufferDisplayLayer *)avslayer completion:(ZJH264DecoderCompletionCallback)completion;
- (void)decodeFile:(NSString*)fileName fileExt:(NSString*)fileExt andDisplayView:(UIImageView *)displayView completion:(ZJH264DecoderCompletionCallback)completion;

@end
