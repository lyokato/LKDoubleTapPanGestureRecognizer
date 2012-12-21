# LKDoubleTapPanGestureRecognizer

## License

MIT-License

## Installation

Copy both 'LKDoubleTapPanGestureRecognizer.h' and 'LKDoubleTapPanGestureRecognizer.m' into your project

## Usage

```
#import "LKDoubleTapPanGestureRecognizer.h"

LKDoubleTapPanGestureRecognizer *recognizer = 
    [LKDoubleTapPanGestureRecognizer alloc] initWithTarget:self
                                                    action:@selector(onDoubleTapPan:)];

// You can choose which direction to support (Veritical set as default)
recognizer.direction = LKDoubleTapPanGestureRecognizerDirectionHorizontal;
//recognizer.direction = LKDoubleTapPanGestureRecognizerDirectionVertical;

[yourView addGestureRecognizer:recognizer];
```

```
- (void)onDoubleTapPan:(LKDoubleTapPanGestureRecognizer*)gesture
{
    // you can handle with gesture's properties described below
    // take a look at Example project.
}
```

### Properties

#### amount

The amount a finger moved.
If you choose LKDoubleTapPanGestureRecognizerDirectionHorizontal as direction,
the finger move 100 pixel to right, and it returns 100.
When the finger move 100 pixel to left, and it returns -100.

If you choose LKDoubleTapPanGestureRecognizerDirectionVertical,
the finger move 100 pixel to up, and it returns 100.
When the finger move 100 pixel to down, and it returns -100.

#### distance

Just same as fabs(amount)

#### center

indicates a point you started a gesture.


