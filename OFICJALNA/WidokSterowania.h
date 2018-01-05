//
//  Camera.h
//  OFICJALNA
//
//  Created by Robert Pudlowski on 29.10.2016.
//  Copyright © 2016 Robert Pudlowski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WidokSterowania : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *Web;
@property (weak, nonatomic) IBOutlet UILabel *mode;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UILabel *controlstatus;
@property (weak, nonatomic) IBOutlet UILabel *temperature;
@property (weak, nonatomic) IBOutlet UIProgressView *progres_start;
@property (weak, nonatomic) IBOutlet UIProgressView *progres_stop;
@property (weak, nonatomic) IBOutlet UILabel *speed;
- (IBAction)stop:(id)sender;
- (IBAction)start:(id)sender;
- (IBAction)DoMenu:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *switchRR;

@end
