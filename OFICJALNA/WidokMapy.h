//
//  MapaViewController.h
//  OFICJALNA
//
//  Created by Robert Pudlowski on 02.10.2016.
//  Copyright © 2016 Robert Pudlowski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>


@interface WidokMapy : UIViewController
@property (strong, nonatomic) IBOutlet UIView *Mapa1;
@property (strong, nonatomic) IBOutlet UITextField *Update;
@property (strong, nonatomic) IBOutlet UILabel *gps_status;
@property (strong, nonatomic) IBOutlet UILabel *loading;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
- (IBAction)ToMainMenu:(id)sender;


@end
