//
//  ViewController.h
//  Jumblify
//
//  Created by Andy Obusek on 10/11/14.
//  Copyright (c) 2014 Tuts+. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JumblifyViewController : UIViewController


@end

//DECLARING THE METHOD LIKE THIS MAKE IT ACCESSIBLE ONLY FOR THE TEST CLASS AND DON'T EXPOSE THE METHOD TP ANY OTHER CLASSES!!!
@interface JumblifyViewController (Test)

- (NSString *)reverseString:(NSString *)stringToReverse;
- (void)doSomethingThatTakesSomeTimesWithCompletionBlock:(void (^)(NSString *result))completion;
@end