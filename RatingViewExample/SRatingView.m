//
//  RatingView.m
//  SpadesPlus
//
//  Created by Selım on 29/09/15.
//  Copyright (c) 2015 peakgames. All rights reserved.
//

#import "SRatingView.h"

@interface SRatingView ()

@property (nonatomic,assign) NSInteger tileCount;
@property (nonatomic,assign) CGFloat rating;

@property (nonatomic,strong) UIView *ratingImageBackground;
@property (nonatomic,strong) UIView *ratingImageForeground;

@end

@implementation SRatingView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initSubviews];
    }

    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    [self initSubviews];
}

-(void)initSubviews
{
    [self initBackgroundImage];
    [self initForegroundImage];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.ratingImageBackground.frame = self.bounds;
}

#pragma mark container views

-(void)initBackgroundImage
{
    self.ratingImageBackground = [[UIView alloc] initWithFrame:self.bounds];
    self.ratingImageBackground.backgroundColor = [UIColor clearColor];
    [self addSubview:self.ratingImageBackground];
}

-(void)initForegroundImage
{
    CGRect foregroundImageFrame = self.bounds;
    foregroundImageFrame.size.width = 0.0;
    
    self.ratingImageForeground = [[UIView alloc] initWithFrame:foregroundImageFrame];
    self.ratingImageForeground.backgroundColor = [UIColor clearColor];
    self.ratingImageForeground.clipsToBounds = YES;
    [self addSubview:self.ratingImageForeground];
}

#pragma mark adjust tile images and frames

-(void)setRatingEmptyTileImage:(UIImage *)ratingEmptyTileImage
{
    _ratingEmptyTileImage = ratingEmptyTileImage;
    
    for (UIView *subview in self.ratingImageBackground.subviews) {
        [subview removeFromSuperview];
    }
    
    for (NSInteger i = 0; i < self.tileCount; i++)
    {
        CGRect tileFrame                = [self frameForIndex:i];
        UIImageView *tileImageView      = [self tileImageViewForFrame:tileFrame];
        tileImageView.image             = ratingEmptyTileImage;
        [self.ratingImageBackground addSubview:tileImageView];
    }
}

-(void)setRatingFillTileImage:(UIImage *)ratingFillTileImage
{
    _ratingFillTileImage = ratingFillTileImage;
    
    for (UIView *subview in self.ratingImageForeground.subviews) {
        [subview removeFromSuperview];
    }
    
    for (NSInteger i = 0; i < self.tileCount; i++)
    {
        CGRect tileFrame            = [self frameForIndex:i];
        UIImageView *tileImageView  = [self tileImageViewForFrame:tileFrame];
        tileImageView.image         = ratingFillTileImage;
        [self.ratingImageForeground addSubview:tileImageView];
    }
}

-(CGRect)frameForIndex:(NSInteger)index
{
    CGFloat tileWidth   = self.ratingImageBackground.frame.size.width / self.tileCount;
    CGFloat tileHeight  = self.ratingImageBackground.frame.size.height;
    
    return  CGRectMake(index * tileWidth, 0, tileWidth, tileHeight);
}

-(UIImageView *)tileImageViewForFrame:(CGRect)tileFrame
{
    UIImageView *tileImageView = [[UIImageView alloc] initWithFrame:tileFrame];
    tileImageView.contentMode  = UIViewContentModeScaleAspectFit;
    tileImageView.backgroundColor   = [UIColor clearColor];
    
    return tileImageView;
}


#pragma mark value setters

-(void)setNumberOfTiles:(NSInteger)tileCount
{
    if (tileCount < 1)
        tileCount = 1;
    
    self.tileCount = tileCount;

    
    UIImage *fillImage  = self.ratingFillTileImage;
    UIImage *emptyImage = self.ratingEmptyTileImage;
    
    if(fillImage)
        self.ratingFillTileImage = fillImage;
    
    if(emptyImage)
        self.ratingEmptyTileImage = emptyImage;
}

-(void)refreshViewStates
{
    
    
}

#pragma mark set rating

-(void)setRateValue:(CGFloat)rating
{
    [self setRateValue:rating animated:NO];
}

-(void)setRateValue:(CGFloat)rating animated:(BOOL)animated
{
    if (rating > 1.0) rating = 1.0;
    if (rating < 0.0) rating = 0.0;
    
    self.rating = rating;
    
    CGFloat estimatedWidth = [self widthForRating:self.rating];
    
    if(animated)
    {
        [self animateForegroundImageView:estimatedWidth];
    }
    else
    {
        CGRect currentForegroundFrame = self.ratingImageForeground.frame;
        currentForegroundFrame.size.width = estimatedWidth;
        self.ratingImageForeground.frame = currentForegroundFrame;
    }
}

-(CGFloat)widthForRating:(CGFloat)rating
{
    CGRect bounds = self.bounds;
    return bounds.size.width * rating;
}

-(void)animateForegroundImageView:(CGFloat)targetWidth
{
    CGRect currentForegroundFrame = self.ratingImageForeground.frame;
    currentForegroundFrame.size.width = targetWidth;
    
    [UIView animateWithDuration:1.0
                     animations:^{
                         self.ratingImageForeground.frame = currentForegroundFrame;
                     }];
}

@end
