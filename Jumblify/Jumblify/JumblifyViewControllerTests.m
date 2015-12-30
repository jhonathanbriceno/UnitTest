//
//  JumblifyViewControllerTests.m
//  Jumblify
//
//  Created by jhonathanbriceno on 8/26/15.
//  Copyright (c) 2015 Tuts+. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "JumblifyViewController.h"

@interface JumblifyViewControllerTests : XCTestCase

@property (nonatomic) JumblifyViewController *vcToTest;

@end

@implementation JumblifyViewControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.vcToTest = [[JumblifyViewController alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//testing regular methods
-(void) testReverseString
{
    NSString *originalString = @"himynameisandy";
    NSString *reversedString = [self.vcToTest reverseString:originalString];
    
    NSString *expectedReverseString  = @"ydnasiemanymih";
    XCTAssertEqualObjects(expectedReverseString, reversedString);
    
}

//Testing Asynchronous methods
-(void) testDoSomethingThatTakesSomeTime
{
    XCTestExpectation *completionExpectation = [self expectationWithDescription:@"Long Method"];
    //NSString *result is what we are actually geting from the real method we are testing
    [self.vcToTest doSomethingThatTakesSomeTimesWithCompletionBlock:^(NSString *result){
        //We expect to get "jhoda" so we compare with the NSString result value that comes from the actual method
        XCTAssertEqualObjects(@"jhoda", result, @"Result was not correct!");
        [completionExpectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:5.0 handler:nil];
}

//Performance Test on a regular method
-(void)testPerformanceReverseString
{
    NSString *originalString = @"himynameisandy";
    [self measureBlock:^{
        [self.vcToTest reverseString:originalString]; //Click on the bubble on the left for info and to set the time baseline of the test;
    }];
}

@end
