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
    CTFrameRef _textFrame;
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
        _textColor = [UIColor whiteColor];
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

//- (void)appendImage:(UIImage *)image
//{
//    [self appendImage:image
//              maxSize:image.size];
//}
//
//- (void)appendImage: (UIImage *)image
//            maxSize: (CGSize)maxSize
//{
//    
//}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    if (ctx == nil)
    {
        return;
    }
    CGContextSaveGState(ctx);
    CGAffineTransform transform = [self transformForCoreText];
    CGContextConcatCTM(ctx, transform);
    
    NSAttributedString *drawString = _attriText;
    [self prepareTextFrame:drawString
                      rect:rect];
    [self drawText:drawString
              rect:rect
           context:ctx];
}

- (void)prepareTextFrame: (NSAttributedString *)string
                    rect: (CGRect)rect
{
    if (_textFrame == nil)
    {
        CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)string);
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathAddRect(path, nil,rect);
        _textFrame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
        CGPathRelease(path);
        CFRelease(framesetter);
    }
}

- (void)drawText: (NSAttributedString *)attributedString
            rect: (CGRect)rect
         context: (CGContextRef)context
{
    if (_textFrame)
    {
        if (_numberOfLines > 0)
        {
            CFArrayRef lines = CTFrameGetLines(_textFrame);
            NSInteger numberOfLines = [self numberOfDisplayedLines];
            
            CGPoint lineOrigins[numberOfLines];
            CTFrameGetLineOrigins(_textFrame, CFRangeMake(0, numberOfLines), lineOrigins);
            
            for (CFIndex lineIndex = 0; lineIndex < numberOfLines; lineIndex++)
            {
                CGPoint lineOrigin = lineOrigins[lineIndex];
                CGContextSetTextPosition(context, lineOrigin.x, lineOrigin.y);
                CTLineRef line = CFArrayGetValueAtIndex(lines, lineIndex);
                
//                CFArrayRef runs = CTLineGetGlyphRuns(line);
                
                CTLineDraw(line, context);
            }
        }
        else
        {
            CTFrameDraw(_textFrame,context);
        }
    }
}

- (NSInteger)numberOfDisplayedLines
{
    CFArrayRef lines = CTFrameGetLines(_textFrame);
    return _numberOfLines > 0 ? MIN(CFArrayGetCount(lines), _numberOfLines) : CFArrayGetCount(lines);
}

- (CGAffineTransform)transformForCoreText
{
    return CGAffineTransformScale(CGAffineTransformMakeTranslation(0, self.bounds.size.height), 1.f, -1.f);
}

#pragma mark - helper
- (NSAttributedString *)attributedString:(NSString *)text
{
    if ([text length])
    {
        NSAttributedString *string = [[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName:self.font,NSForegroundColorAttributeName:_textColor}];
        return string;
    }
    else
    {
        return [[NSAttributedString alloc]init];
    }
}

@end
