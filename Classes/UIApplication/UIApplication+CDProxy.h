//
//  UIApplication+CDProxy.h
//  CrutchKitExample
//
//  Created by Smal Vadim on 07/06/15.
//  Copyright (c) 2015 cognitivedisson. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CDProxy;

@interface UIApplication (CDProxy)

- (id <CDProxy>)observersProxyForProtocol:(Protocol *)protocol
                                       selector:(SEL)selector
                                      forSender:(UIResponder *)sender;

@end
