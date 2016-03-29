//
//  OLAttriLabel.h
//  OLAttriLabelDemo
//
//  Created by ctkj108-xx on 16/3/23.
//  Copyright © 2016年 ctkj108-xx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@interface OLAttriLabel : UIView

@property(nonatomic,strong) UIFont *font;
@property(nonatomic,strong) UIColor *textColor;
@property(nonatomic,assign) NSUInteger numberOfLines;

//普通文本
- (void)appendText:(NSString *)txt;
//富文本
- (void)appendAttriText:(NSAttributedString *)attriTxt;
//图片
//- (void)appendImage:(UIImage *)image;
//- (void)appendImage: (UIImage *)image
//            maxSize: (CGSize)maxSize;

@end
