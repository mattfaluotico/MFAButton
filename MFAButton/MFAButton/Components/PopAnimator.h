//
//  PopAnimator.h
//  MFAButton
//
//  Created by Matthew Faluotico on 11/12/14.
//  Copyright (c) 2014 mf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/***
 *  @author mf, Nov-12-2014
 *
 *  Creates an animation for each of the different elements.
 *  The animation is returned, thus must still be bound to the view.
 */

@interface PopAnimator : NSObject

+ (void) fadeInOption: (NSInteger) index ;

+ (void) fadeOutOptions: (NSInteger) index ;

+ (void) fadeInBackground: (UIView *) background;

+ (void) fadeOutBackground: (UIView *) background;

+ (void) shrinkViewOnTouchDown: (UIView *) view;

+ (void) restoreViewOnTouchUp: (UIView *) view;

@end
