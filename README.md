## SRatingView

SRatingView simplifies rating visulatisation via a simple UIView subclass. It allows you to display any rating value easily, even with animation!

![Sample](/RatingViewExample/sample.png?raw=true)

## Requirements
  - iOS 6.0 or higher
  - Requires ARC

## Installation

The easiest way to use SRatingView in your app is via [CocoaPods](http://cocoapods.org/ "CocoaPods").

1. Add the following line in the project's Podfile file: `pod 'SRatingView' `
2. Run the command `pod install` from the Podfile folder directory.

## Usage

SRatingView requires an initial setup to display the rate value correctly. 
It assumes that you have both a filled and an empty rating image. For the example project i use these images:

![Fill Image](/RatingViewExample/rating-star@2x.png?raw=true)
![Empty Image](/RatingViewExample/rating-star-empty@2x.png?raw=true)

First we will assign these images accordingly:

```objective-c
    self.ratingView.ratingFillTileImage  = [UIImage imageNamed:@"rating-star"];
    self.ratingView.ratingEmptyTileImage = [UIImage imageNamed:@"rating-star-empty"];
```
The configuration requires how many tiles of these images will be used:
```objective-c
	[self.ratingView setNumberOfTiles:5];
```
The only thing left is to display the actual rate value:

```objective-c
    [self.ratingView setRateValue:0.3 animated:YES];
```

Result is here:
![Result](/RatingViewExample/sample.png?raw=true)

# Notes

For next version, i plan to add action to SRatingView,to make the user able to rate anything.
Action will support both float and integer type of values.

## License
Distributed under the permissive zlib license. See the LICENSE file for more info.

## Contact
Selim Bakdemir

- selim.bakdemir@gmail.com
