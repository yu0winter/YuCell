//
//  UILabel+ContentSize.m
//  YUCell
//
//  Created by 牛玉龙 on 16/5/20.
//  Copyright © 2016年 nyl. All rights reserved.
//

#import "UILabel+ContentSize.h"
#define LINE_SPACING 8
@implementation UILabel (ContentSize)
- (CGFloat)widthWithMaxWidth:(CGFloat)maxWidth{
    return [self contentSizeForWidth:maxWidth].width;
}
- (CGSize)contentSizeForWidth:(CGFloat)width
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = self.lineBreakMode;
    paragraphStyle.alignment = self.textAlignment;
    paragraphStyle.lineSpacing = LINE_SPACING;

    NSDictionary *attrs = @{NSFontAttributeName : self.font};
    
    CGRect contentFrame = [self.text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attrs context:nil];
    return contentFrame.size;
}

@end
