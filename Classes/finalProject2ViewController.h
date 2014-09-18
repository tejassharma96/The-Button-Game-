//
//  finalProject2ViewController.h
//  finalProject2
//
//  Created by iD Student Account on 6/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface finalProject2ViewController : UIViewController {
	int a;
	float d;
    NSInteger hs;
    int c;
	double q;
	IBOutlet UILabel*timeLabel;
	IBOutlet UILabel*scoreLabel;
	IBOutlet UILabel*lowLabel;
    IBOutlet UILabel*pauseLabel;
	NSTimer *t;
	BOOL go;
}

-(IBAction)button:(id)sender;
-(void)onTick:(NSTimer *)timer;
-(IBAction)pause:(id)sender;
-(IBAction)highScore:(id)sender;
-(NSString *)pathOfFile;
-(void)applicationWillTerminate: (NSNotification*)notification;
@end

