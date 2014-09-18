//
//  finalProject2ViewController.m
//  finalProject2
//
//  Created by iD Student Account on 6/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "finalProject2ViewController.h"

@implementation finalProject2ViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
//    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
//    hs  = [prefs integerForKey:@"HighScore"];
    hs = [[NSUserDefaults standardUserDefaults] integerForKey:@"hs"];
	go=NO;
	a=0;
	d=30;
	t = [NSTimer scheduledTimerWithTimeInterval: 0.01
										 target: self
									   selector:@selector(onTick:)
									   userInfo: nil repeats:YES];
	}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

-(void)onTick:(NSTimer *)timer {
	if(go==YES){
		d=d-0.01;
	}
	[timeLabel setText:[NSString stringWithFormat:@"%f",d]];
	if (d<=0.0) {
		[t invalidate];
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time Up!!!!" 
														message:[NSString stringWithFormat:@"You scored:%d",a]
													   delegate:nil 
											  cancelButtonTitle:@"OK" 
											  otherButtonTitles: nil];
		[alert show];
		[alert release];
        if (a>hs) {
            hs=a;
        }
		a=0;
		d=30;
        c=0;
        [pauseLabel setText:@"Play"];
		go=NO;
		//[lowLabel setText:@"Tap a button to start"];
        [lowLabel setAlpha:1.0];
         [[NSUserDefaults standardUserDefaults] setInteger:hs forKey:@"hs"];
		t = [NSTimer scheduledTimerWithTimeInterval: 1
											 target: self
										   selector:@selector(onTick:)
										   userInfo: nil repeats:YES];
		
	}
	
	
}

-(IBAction)button:(id)sender {
    if(go==YES){
	a++;
	//[lowLabel setText:@""];
    
	[scoreLabel setText:[NSString stringWithFormat:@"%d",a]];
    }

}
-(IBAction)pause:(id)sender{
    [lowLabel setAlpha:0.0];
    c++;
    if (c%2==1) {
        go=YES;
        [pauseLabel setText:@"Pause"];
    }else if(c%2==0&&c>=2){
        go=NO;
        [pauseLabel setText:@"Resume"];
    }
}
-(IBAction)highScore:(id)sender{
    if(go==NO){
		NSLog(@"Log");
		UIAlertView *alertTwo = [[UIAlertView alloc] initWithTitle:@"High Score" 
                                                    message:[NSString stringWithFormat:@"Your High Score is:%d",hs]
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles: nil];
		[alertTwo show];
		[alertTwo release];
        
	}
    
}

/*-(void)applicationWillTerminate: (NSNotification*)notification{
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    [prefs setInteger:hs  forKey:@"HighScore "];
    
    [prefs synchronize];
 
    [[NSUserDefaults standardUserDefaults] setInteger:hs forKey:@"TopScore"];
}
*/


@end
