//
//  Rejestracja.m
//  OFICJALNA
//
//  Created by Robert Pudlowski on 16.12.2017.
//  Copyright © 2017 Robert Pudlowski. All rights reserved.
//

#import "Rejestracja.h"

@interface Rejestracja ()

@end

@implementation Rejestracja

- (void)viewDidLoad {
    [super viewDidLoad];
     UIFont *nowaCzcionka2  = [UIFont fontWithName: @"Luckiest Guy" size:31.0];
    _BILL.font=nowaCzcionka2;

    _Rejestruj.layer.cornerRadius=6.0;
    _Rejestruj.clipsToBounds = YES;
    _DaneDoR.layer.cornerRadius=6.0;
    _DaneDoR.clipsToBounds = YES;
    _Wr.layer.cornerRadius=6.0;
    _Wr.clipsToBounds = YES;
    _Zarejestruj.layer.cornerRadius=6.0;
    _Zarejestruj.clipsToBounds = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)ZarejestrujK:(id)sender  {
    
    if ([_hasło.text isEqualToString:@""] || [_hasło2.text isEqualToString:@""] || [_mail.text isEqualToString:@""]){
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Ups!" message:@"Wypełnij wszystkie pola" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
    }
    
//sprawdza czy nie ma pustych pól, jak nie ma to wykonuje elsa
    else{
       
        
        if([_hasło.text length] <= 7){
            UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Ups" message:@"Hasło musi mieć minimum 8 znaków! Popraw się..." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [error show];
        }
        else{
        
        
    if ([_hasło.text isEqualToString:_hasło2.text]){
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Brawo!" message:@"Zarejestrowano. Zaloguj sie..." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
        [self performSegueWithIdentifier:@"DoMenu" sender:self];
    }
    else{
        
            UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Ups" message:@"Hasła się nie zgadzają, popraw je!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [error show];
       
    }}}
}
@end
