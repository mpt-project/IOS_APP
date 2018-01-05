//
//  Rejestracja.h
//  OFICJALNA
//
//  Created by Robert Pudlowski on 16.12.2017.
//  Copyright © 2017 Robert Pudlowski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Rejestracja : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *DaneDoR;
@property (weak, nonatomic) IBOutlet UIImageView *Rejestruj;
@property (strong, nonatomic) IBOutlet UITextField *mail;
@property (weak, nonatomic) IBOutlet UIButton *Wr;
@property (weak, nonatomic) IBOutlet UILabel *BILL;

@property (weak, nonatomic) IBOutlet UIButton *Zarejestruj;
@property (strong, nonatomic) IBOutlet UITextField *hasło;
@property (strong, nonatomic) IBOutlet UITextField *hasło2;

- (IBAction)ZarejestrujK:(id)sender;

@end
