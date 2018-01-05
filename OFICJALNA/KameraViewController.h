//
//  KameraViewController.h
//  OFICJALNA
//
//  Created by Robert Pudlowski on 02.10.2016.
//  Copyright © 2016 Robert Pudlowski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KameraViewController : UIViewController
- (IBAction)FromCamToMap:(id)sender;
@property (weak, nonatomic) IBOutlet UIWebView *WebView;

@end
