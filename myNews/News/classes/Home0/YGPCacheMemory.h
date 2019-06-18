//
//  YGPCacheMemory.h
//  News
//
//  Created by zhangxj on 2019/6/16.
//  Copyright © 2019年 Kwangchiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YGPCacheMemory : NSObject
@property (nonatomic,assign)NSUInteger memoryCacheCountLimit;

+ (instancetype)sharedMemory;

- (void)setData:(NSData*)data forKey:(NSString*)key;

- (NSData*)objectForKey:(NSString*)key;

- (void)removeDataForKey:(NSString*)key;

- (void)removeAllData;

- (BOOL)containsDataForKey:(NSString*)key;

@end
