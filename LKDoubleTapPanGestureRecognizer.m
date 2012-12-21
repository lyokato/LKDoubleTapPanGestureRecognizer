#import "LKDoubleTapPanGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface LKDoubleTapPanGestureRecognizer ()
{
    BOOL _foundDoubleTap;
}
@end

@implementation LKDoubleTapPanGestureRecognizer

@synthesize direction = _direction;
@synthesize amount    = _amount;
@synthesize distance  = _distance;
@synthesize center    = _center;

- (void)initializeProperties
{
    _amount = 0.0;
    _distance = 0.0;
    _center = CGPointZero;
    _foundDoubleTap = NO;
}

- (void)setup 
{
    _direction = LKDoubleTapPanGestureRecognizerDirectionVertical;
    [self initializeProperties];
}

- (id)initWithTarget:(id)target 
              action:(SEL)action
{
    if (self = [super initWithTarget:target 
                              action:action]) {
        [self setup];
    }
    return self;
}

- (void)reset
{
    [super reset];
    [self initializeProperties];
}

- (void)touchesBegan:(NSSet *)touches 
           withEvent:(UIEvent *)event
{
    [super touchesBegan:touches 
              withEvent:event];

    if ([touches count] != 1) {
        self.state = UIGestureRecognizerStateFailed;
        return;
    }

    UITouch *touch = [touches anyObject];
    if ([touch tapCount] == 2) {
        _foundDoubleTap = YES;
        _center = [touch locationInView:self.view];
    } else if ([touch tapCount] > 2) {
        [self initializeProperties];
        self.state = UIGestureRecognizerStateFailed;
        return;
    }
}

- (void)touchesMoved:(NSSet *)touches 
           withEvent:(UIEvent *)event
{
    [super touchesMoved:touches 
              withEvent:event];
    
    if (self.state == UIGestureRecognizerStateFailed)
        return;
    
    if (!_foundDoubleTap) {
        self.state = UIGestureRecognizerStateFailed;
        return;
    }

    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];

    if (_direction == LKDoubleTapPanGestureRecognizerDirectionVertical) {
        _amount = _center.y - currentPoint.y;
    } else {
        _amount = currentPoint.x - _center.x;
    }
    _distance = fabs(_amount);
    self.state = UIGestureRecognizerStateChanged;
}

- (void)touchesEnded:(NSSet *)touches 
           withEvent:(UIEvent *)event
{
    [super touchesEnded:touches 
              withEvent:event];
    _foundDoubleTap = NO;
    self.state = UIGestureRecognizerStateEnded;
}

- (void)touchesCancelled:(NSSet *)touches 
               withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches 
                  withEvent:event];
    self.state = UIGestureRecognizerStateFailed;
    [self initializeProperties];
}

@end
