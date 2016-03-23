//
//  OLAttriLabel.m
//  OLAttriLabelDemo
//
//  Created by ctkj108-xx on 16/3/23.
//  Copyright © 2016年 ctkj108-xx. All rights reserved.
//

#import "OLAttriLabel.h"

@interface OLAttriLabel ()
{
    NSMutableAttributedString *_attriText;
}
@end
@implementation OLAttriLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _attriText = [[NSMutableAttributedString alloc] init];
        _font = [UIFont systemFontOfSize:15.f];
        _textColor = [UIColor darkGrayColor];
        if (self.backgroundColor == nil)
        {
            self.backgroundColor = [UIColor whiteColor];
        }
        
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)appendText:(NSString *)txt
{
    [_attriText appendAttributedString:[self attributedString:txt]];
}

- (void)appendAttriText:(NSAttributedString *)attriTxt
{
    [_attriText appendAttributedString:attriTxt];
}

- (void)appendImage:(UIImage *)image
{
    [self appendImage:image
              maxSize:image.size];
}

- (void)appendImage: (UIImage *)image
            maxSize: (CGSize)maxSize
{
    
}

- (void)drawRect:(CGRect)rect
{
    
}

#pragma mark - 辅助方法
- (NSAttributedString *)attributedString:(NSString *)text
{
    if ([text length])
    {
        NSAttributedString *string = [[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName:self.font}];
        return string;
    }
    else
    {
        return [[NSAttributedString alloc]init];
    }
}

@end
