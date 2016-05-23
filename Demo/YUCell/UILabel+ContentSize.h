//
//  UILabel+ContentSize.h
//  YUCell
//
//  Created by 牛玉龙 on 16/5/20.
//  Copyright © 2016年 nyl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ContentSize)
- (CGSize)contentSizeForWidth:(CGFloat)width;
- (CGFloat)widthWithMaxWidth:(CGFloat)maxWidth;
@end
