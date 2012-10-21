// Part of iOSKit http://foundationk.it
//
// Contains Stuff from Peter Steinberger's Gist: https://gist.github.com/1144242
// Contains Stuff from Matt Gemell's MGImageUtilities: http://mattgemmell.com/2010/07/05/mgimageutilities
// Contains Stuff from Sam Soffes' SSToolkit: https://github.com/samsoffes/sstoolkit

#import <UIKit/UIKit.h>

/**
 This category adds various functionalities to UIImage
 */

@interface UIImage (FKAdditions)

/** Creates an image with a given size in a given color */
+ (UIImage *)imageWithSize:(CGSize)size color:(UIColor *)color;

/**
 This method preloads an image for faster drawing.
 */
- (UIImage *)preloadedImage;

/**
 This method returns a new UIImage tinted with the given color.
 It calls imageTintedWithColor:fraction: with fraction 0.

 @param color The Tint-Color
 @return A new image tinted with the given color
 */
- (UIImage *)imageTintedWithColor:(UIColor *)color;
- (UIImage *)imageTintedWithColor:(UIColor *)color fraction:(CGFloat)fraction;

/**
 Creates and returns a new cropped image object.

 @param rect A rectangle whose coordinates specify the area to create an image from in points.
 @return A new cropped image object.
 */
- (UIImage *)imageCroppedToRect:(CGRect)rect;


@end
