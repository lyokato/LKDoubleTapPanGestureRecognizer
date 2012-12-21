#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

typedef enum
{
    LKDoubleTapPanGestureRecognizerDirectionVertical,
    LKDoubleTapPanGestureRecognizerDirectionHorizontal
} LKDoubleTapPanGestureRecognizerDirection;

@interface LKDoubleTapPanGestureRecognizer : UIGestureRecognizer
@property (nonatomic, assign) LKDoubleTapPanGestureRecognizerDirection direction;
@property (nonatomic, assign, readonly) float amount;
@property (nonatomic, assign, readonly) float distance;
@property (nonatomic, assign, readonly) CGPoint center;
@end

