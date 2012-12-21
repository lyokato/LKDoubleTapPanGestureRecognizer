//
//  LKViewController.m
//  LKDoubleTapPanGestureExample
//
//  Created by Lyo Kato on 12/12/21.
//  Copyright (c) 2012 Lyo Kato. All rights reserved.
//

#import "LKViewController.h"
#import "LKDoubleTapPanGestureRecognizer.h"

@interface LKViewController ()
@property (nonatomic, strong) UIView *sub;
@property (nonatomic, assign) float panScalingRateFactor;
@property (nonatomic, assign) CGAffineTransform startingSubTransform;
@end

@implementation LKViewController

@synthesize sub, panScalingRateFactor, startingSubTransform;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.panScalingRateFactor = 0.01;

    self.view.backgroundColor = [UIColor redColor];
    self.view.frame = [UIScreen mainScreen].applicationFrame;
    self.sub = [[UIView alloc] initWithFrame:CGRectInset(self.view.bounds, 60, 100)];
    self.sub.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.sub];

    LKDoubleTapPanGestureRecognizer *recognizer = 
        [[LKDoubleTapPanGestureRecognizer alloc] initWithTarget:self 
                                                         action:@selector(onDoubleTapPan:)];
    recognizer.direction = LKDoubleTapPanGestureRecognizerDirectionHorizontal;
    [self.sub addGestureRecognizer:recognizer];

    self.startingSubTransform = self.sub.transform;

}

- (void)onDoubleTapPan:(LKDoubleTapPanGestureRecognizer *)recognizer
{
    float dist = recognizer.distance;
    float scaleRate = 1.0;
    if (recognizer.amount > 0) {
        scaleRate += dist * self.panScalingRateFactor;
        if (scaleRate > 4)
            scaleRate = 4;
    } else {
        scaleRate -= dist * self.panScalingRateFactor;
        if (scaleRate < 0.1)
            scaleRate = 0.1;
    }
    self.sub.transform = CGAffineTransformScale(self.startingSubTransform, scaleRate, scaleRate);
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        self.startingSubTransform = self.sub.transform;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
