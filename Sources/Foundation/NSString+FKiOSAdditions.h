// Part of iOSKit http://foundationk.it

#import <Foundation/Foundation.h>

/**
 This category adds various additions to NSString related to UIKit or the iPhone
 */
@interface NSString (FKiOSAdditions)

/**
 This method removes all characters from NSString that are no valid phone number characters.
 
 @return a sanitized phone number
 */
- (NSString *)sanitizedPhoneNumber;

@end
