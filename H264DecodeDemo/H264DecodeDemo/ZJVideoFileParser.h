//
//  ZJVideoFileParser.h
//  H264DecodeDemo
//
//  Created by ZJ on 2018/9/26.
//  Copyright © 2018年 ZJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJVideoPacket : NSObject

@property (nonatomic, assign) uint8_t* buffer;
@property (nonatomic, assign) NSInteger size;

@end

@interface ZJVideoFileParser : NSObject

- (BOOL)open:(NSString*)fileName;
- (ZJVideoPacket *)nextPacket;
- (void)close;

@end
