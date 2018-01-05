//
//  LauncherView.h
//  OFICJALNA
//
//  Created by Robert Pudlowski on 13.10.2016.
//  Copyright © 2016 Robert Pudlowski. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WidokStartu: UIViewController
//@property (weak, nonatomic) IBOutlet UILabel *ładowanie;
@property (weak, nonatomic) IBOutlet UILabel *kameraip;
@property (weak, nonatomic) IBOutlet UILabel *robotip;
//@property (weak, nonatomic) IBOutlet UILabel *BILL;
@property (weak, nonatomic) IBOutlet UILabel *BILL;

@property (weak, nonatomic) IBOutlet UITextField *CZCIONKA_ZALOGUJ;
@property (weak, nonatomic) IBOutlet UIView *TŁO_ZALOGUJ;
@property (weak, nonatomic) IBOutlet UITextField *CZCIONKA_HASŁO;
@property (weak, nonatomic) IBOutlet UILabel *CZCIONKA_LOGIN;
@property (weak, nonatomic) IBOutlet UITextField *CZCIONKA_NIE_MASZ;

- (IBAction)ZALOGUJ3:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *login;
@property (weak, nonatomic) IBOutlet UITextField *haslo;

@property (weak, nonatomic) IBOutlet UITextField *CZCIONKA_DOŁĄCZ;


@property (strong, nonatomic) IBOutlet UIView *TŁO_DOŁĄCZ2;
@property (weak, nonatomic) IBOutlet UILabel *ZALOGUJ;

@property (weak, nonatomic) IBOutlet UIView *ZAREJESTRUJ;

@property (weak, nonatomic) IBOutlet UILabel *TŁO_ZALOGUJ2;

//@property (weak, nonatomic) IBOutlet UILabel *robotip;

@end
