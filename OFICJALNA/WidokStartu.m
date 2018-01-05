//
//  LauncherView.m
//  OFICJALNA
//
//  Created by Robert Pudlowski on 13.10.2016.
//  Copyright © 2016 Robert Pudlowski. All rights reserved.
//

#import "WidokStartu.h"


@interface WidokStartu () 

@end
int control2=0;
int camera2=0;
@implementation WidokStartu
@synthesize kameraip, robotip, BILL;


- (void)robotconnection
{
    NSString *str = [NSString stringWithFormat: @"http://192.168.4.11/IP"];
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];
    NSURL * url = [NSURL URLWithString:str];
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithURL:url
                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        ;
                                                        if(error == nil)
                                                        {   control2=1;
                                                            NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                                            if ([text compare:@"test"] == NSOrderedSame) {
                                                                control2=1;
                                                                robotip.text=@"ONLINE";
                                                            }
                                                            
                                                          
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        }
                                                        
                                                    }];
    
    if (control2==0){
        
        robotip.text=@"OFFLINE";

    }
    
    [dataTask resume];

    
    NSString *str4 = [NSString stringWithFormat: @"http://192.168.4.11/GPSoff"];
    
    NSURLSessionConfiguration *defaultConfigObject4 = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession4 = [NSURLSession sessionWithConfiguration: defaultConfigObject4 delegate: self delegateQueue: [NSOperationQueue mainQueue]];
    NSURL * url4 = [NSURL URLWithString:str4];
    NSURLSessionDataTask * dataTask4 = [defaultSession4 dataTaskWithURL:url4
                                                      completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                          
                                                          
                                                          
                                                          
                                                          
                                                          
                                                          
                                                          
                                                      }];
    
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.4.11/1"];
    // NSData *data = [NSData dataWithContentsOfURL:url];
    // NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    // timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];;
    /// }
    
    
    
    [dataTask4 resume];

    
}



-(void) cameraconnection{
    
    NSString *str = [NSString stringWithFormat: @"http://192.168.4.1/CAM"];
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];
    NSURL * url = [NSURL URLWithString:str];
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithURL:url
                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        ;
                                                        if(error == nil)
                                                        {
                                                            NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                                            if ([text compare:@"cam_online"] == NSOrderedSame) {
                                                                camera2=1;
                                                                kameraip.text=@"ONLINE";
                                                            }
                                                            
                                                  
                                                        }
                                                        
                                                    }];
    
    if (camera2==0){
        kameraip.text=@"OFFLINE";
        }
    camera2=0;
    [dataTask resume];
    
    
}
 




- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIFont *nowaCzcionka  = [UIFont fontWithName: @"Gotham Light" size:15.0];
    UIFont *nowaCzcionka2  = [UIFont fontWithName: @"Luckiest Guy" size:31.0];
    UIFont *nowaCzcionka3  = [UIFont fontWithName: @"Lato" size:12.0];
    UIFont *nowaCzcionka4  = [UIFont fontWithName: @"Lato" size:16.0];
    UIFont *nowaCzcionka6  = [UIFont fontWithName: @"Lato" size:25.0];
    UIFont *nowaCzcionka5  = [UIFont fontWithName: @"Lato" size:16.0];
    BILL.backgroundColor=[UIColor colorWithRed:156/255.0f green:31/255.0f blue:77/255.0f alpha:1.0f];
    _ZAREJESTRUJ.layer.cornerRadius=6.0;
    _ZAREJESTRUJ.clipsToBounds = YES;
    _TŁO_ZALOGUJ2.layer.cornerRadius=6.0;
    _TŁO_ZALOGUJ2.clipsToBounds = YES;
    BILL.font=nowaCzcionka2;
    _CZCIONKA_HASŁO.font=nowaCzcionka3;
    _CZCIONKA_LOGIN.font=nowaCzcionka3;
    _CZCIONKA_DOŁĄCZ.font=nowaCzcionka5;
    _ZALOGUJ.font=nowaCzcionka4;
    _CZCIONKA_NIE_MASZ.font=nowaCzcionka6;
    _ZAREJESTRUJ.backgroundColor=[UIColor colorWithRed:156/255.0f green:31/255.0f blue:77/255.0f alpha:1.0f];
    _TŁO_ZALOGUJ2.backgroundColor=[UIColor colorWithRed:156/255.0f green:31/255.0f blue:77/255.0f alpha:1.0f];
    robotip.font=nowaCzcionka;
   [self performSelector:@selector(cameraconnection) // funkcja którą uruchamia sprawdzanie ip kamery dopiero po 5 sek
             withObject:@"sprawdzanieip"
               afterDelay:3];
   [self performSelector:@selector(robotconnection) // funkcja którą uruchamia sprawdzanie ip robota do//ero po 5 sek
               withObject:@"sprawdzanieip"
               afterDelay:3];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)showMainMenu {
    
}

- (void) applicationDidFinishLaunching:(UIApplication*)application
{
    [NSThread sleepForTimeInterval:1.0];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/






- (IBAction)ZALOGUJ3:(id)sender {
    
    [self performSegueWithIdentifier:@"IdzDoPoczatku" sender:self];
    /*  if ([_login.text isEqualToString:@""] || [_haslo.text isEqualToString:@""] ){
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Ups!" message:@"Wypełnij wszystkie pola" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
   [error show];
    }
    
    //sprawdza czy nie ma pustych pól, jak nie ma to wykonuje elsa
    else{
        
        
        if([_haslo.text length] <= 0){
            UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Ups" message:@"Hasło jest za krótkie Popraw się..." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [error show];
        }
        else{
            
            
            if ([_haslo.text isEqualToString:_haslo.text]){
                UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Brawo!" message:@"Zalogowano" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [error show];
                [self performSegueWithIdentifier:@"IdzDoPoczatku" sender:self];
            }
            else{
                
                UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Ups" message:@"Niepoprawne dane!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [error show];
                
            }}}
    
    */
    }

@end
