//
//  NsNotificationCenterTest.m
//  MyWallet
//
//  Created by Juan Luis Garcia on 28/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FakeNotificationCenter.h"
#import "Wallet.h"

@interface NsNotificationCenterTest : XCTestCase

@end

@implementation NsNotificationCenterTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


-(void) testThatSubcribesToMemoryWarning{
    
    FakeNotificationCenter *fake = [FakeNotificationCenter new];
    
    Wallet *fat = [Wallet new];
    
    [fat subscribeToMemoryWarning:(NSNotificationCenter *)fake];
    
    NSDictionary *obs = [fake observers];
    
    id observer = [obs objectForKey:UIApplicationDidReceiveMemoryWarningNotification];
    
    XCTAssertEqualObjects(observer, fat, @"Fat object must subscribe to UIApplicationDidRecieveMemoryWarninngNotification");
    
    
    
    
    
}

















@end
