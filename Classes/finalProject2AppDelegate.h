//
//  finalProject2AppDelegate.h
//  finalProject2
//
//  Created by iD Student Account on 6/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class finalProject2ViewController;

@interface finalProject2AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    finalProject2ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet finalProject2ViewController *viewController;

@end

