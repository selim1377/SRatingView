//
//  RatingView.h
//  SpadesPlus
//
//  Created by Selım on 29/09/15.
//  Copyright (c) 2015 peakgames. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRatingView : UIView

@property (nonatomic,strong) UIImage *ratingEmptyTileImage;
@property (nonatomic,strong) UIImage *ratingFillTileImage;


/*!
 Determines how many tiles of images displayed for rating indicator
 */
-(void)setNumberOfTiles:(NSInteger)tileCount;


/*!
 Look up to animated version
 */
-(void)setRateValue:(CGFloat)rating;


/*!
 Set rating value from 0 to 1. Normalize any rating value if necessary
 Displays a fill animation while setting the rating value
 */
-(void)setRateValue:(CGFloat)rating animated:(BOOL)animated;

@end
