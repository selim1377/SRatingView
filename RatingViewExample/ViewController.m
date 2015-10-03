//
//  ViewController.m
//  RatingViewExample
//
//  Created by Selim on 03.10.15.
//  Copyright (c) 2015 Selim Bakdemir. All rights reserved.
//

#import "ViewController.h"
#import "SRatingView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet SRatingView *ratingView;
@property (strong, nonatomic) SRatingView *ratingView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Configuration for rating view
    [self.ratingView setNumberOfTiles:5];
    
    self.ratingView.ratingFillTileImage  = [UIImage imageNamed:@"rating-star"];
    self.ratingView.ratingEmptyTileImage = [UIImage imageNamed:@"rating-star-empty"];
    
    self.ratingView2 = [[SRatingView alloc] initWithFrame:CGRectOffset(self.ratingView.frame, 0, 50)];
    self.ratingView2.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.ratingView2];
    
    // Configuration for rating view
    [self.ratingView2 setNumberOfTiles:7];
    
    self.ratingView2.ratingFillTileImage  = [UIImage imageNamed:@"rating-star"];
    self.ratingView2.ratingEmptyTileImage = [UIImage imageNamed:@"rating-star-empty"];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.ratingView setRateValue:0.3 animated:YES];
    [self.ratingView2 setRateValue:0.5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
