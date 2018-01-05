//
//  ViewController.m
//  OFICJALNA
//
//  Created by Robert Pudlowski on 02.10.2016.
//  Copyright © 2016 Robert Pudlowski. All rights reserved.
//

#import "WidokMenu.h"

@interface WidokMenu () 
  //  NSMutableArray *imagee;


//}

@end

@implementation WidokMenu
int koniec2=0;
int koniec1=0;
int b;
int control1=0;
int engines1=0;
int temp1=0;
int camera1=0;
int gps1=0;
int wyjscie;
- (void)viewDidLoad {
    
    [super viewDidLoad];
    wyjscie=0;
    koniec2=0;
    tablica = [[NSMutableArray alloc]initWithObjects: @"Audi A6", @"BMW Z3", @"Audi Quattro", @"Audi TT",nil];
    NSLog(@"vpoczatke: \n" );
    UIFont *nowaCzcionka  = [UIFont fontWithName: @"Gotham Light" size:15.0];
       UIFont *nowaCzcionka2  = [UIFont fontWithName: @"Luckiest Guy" size:31.0];
    _BILL_MENUGŁ.font=nowaCzcionka2;
    _BILL_MENUGŁ.backgroundColor=[UIColor colorWithRed:156/255.0f green:31/255.0f blue:77/255.0f alpha:1.0f];
    
    _camera.font=nowaCzcionka;
    _control.font=nowaCzcionka;
    _temp.font=nowaCzcionka;
    _gps.font=nowaCzcionka;
    _engines.font=nowaCzcionka;
    self.navigationItem.title=@"MAIN MENU";
    [self.navigationController setNavigationBarHidden:YES];
   [self performSelector:@selector(methodA)];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tablica count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
    // This is just Programatic method you can also do that by xib !
}
- (void)tableView:(UITableView *)tableView
accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    [self performSegueWithIdentifier:@"DoC" sender:nil];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IDcel" forIndexPath:indexPath];
  
    
    
    cell.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    cell.layer.shadowOffset = CGSizeMake(0, 2);
    cell.layer.shadowOpacity = 0.8;
    cell.layer.shadowRadius = 3;
    cell.layer.masksToBounds = NO;
    cell.layer.cornerRadius=4.0;
    cell.imageView.image=[UIImage imageNamed:@"Dołącz.png"];
    cell.textLabel.text=@"Zaloguj";
    cell.textLabel.text=@"test";
    cell.detailTextLabel.text=@"test";
 
    
    
    
    return cell;
    
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle==UITableViewCellEditingStyleDelete){
        [tablica removeObjectAtIndex:indexPath.row];
        [_table deleteRowsAtIndexPaths:[NSMutableArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
}
}

- (IBAction)ToMapView:(id)sender {
    b=1;
    wyjscie=1;

    [self performSegueWithIdentifier:@"ToMap" sender:self];
    NSString *str3 = [NSString stringWithFormat: @"http://192.168.4.11/GPSon"];
    
    
    NSURLSessionConfiguration *defaultConfigObject3 = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession3 = [NSURLSession sessionWithConfiguration: defaultConfigObject3 delegate: self delegateQueue: [NSOperationQueue mainQueue]];
    NSURL * url3 = [NSURL URLWithString:str3];
    NSURLSessionDataTask * dataTask3 = [defaultSession3 dataTaskWithURL:url3
                                                      completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                          
                                                          
                                                          
                                                          
                                                          
                                                          
                                                          
                                                          
                                                      }];
    
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.4.11/1"];
    // NSData *data = [NSData dataWithContentsOfURL:url];
    // NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    // timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];;
    /// }
    
    
    
    [dataTask3 resume];


}

- (IBAction)cam:(id)sender {
    wyjscie=1;
    [self performSegueWithIdentifier:@"ToCameraa" sender:self];
    
    }


- (void) methodA
{
    

    //Start playing an audio file.
    NSLog(@"vmetA: \n" );

    //NSTimer calling Method B, as long the audio file is playing, every 5 seconds.
    [NSTimer scheduledTimerWithTimeInterval:2.0f
                                     target:self selector:@selector(methodB:) userInfo:nil repeats:YES];
}

- (void) methodB:(NSTimer *)timer
{
    
    if(wyjscie==0){
        NSLog(@"vmetB \n" );
                if([self sendHTTPGet: @"1/CAM"]){
        
        if(camera1==0){
            _camera.text=@"OFFLINE";
        }}
        camera1=0;
        
        if([self sendHTTPGet: @"11/all"]==TRUE){

        if(control1==0){
            _control.text=@"OFFLINE";
        }
            control1=0;
        if(temp1==0){
            _temp.text=@"OFFLINE";
        }
            temp1=0;
        if(engines1==0){
            _engines.text=@"OFFLINE";
        }
            engines1=0;
        if(gps1==0){
            _gps.text=@"OFFLINE";
        }

            gps1=0;
        }
        
    }}
-(BOOL) sendHTTPGet: (NSString*)x ;
    {


    NSString *str = [NSString stringWithFormat: @"http://192.168.4.%@", x];
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];
    NSURL * url = [NSURL URLWithString:str];
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithURL:url
                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        
                                                        if(error == nil)
                                                        {
                                                            NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                                            NSLog(@"all: %@ \n", text);
                                                            if(text!= nil){
                                                            if ([x compare:@"1/CAM"] == NSOrderedSame){
                                                                 if ([text compare:@"cam_online"] == NSOrderedSame){
                                                                _camera.text=@"ONLINE";
                                                                     camera1=1;
                                                                 }
                                                                
                                                            }
                                                            
                                                            
                                                            if ([x compare:@"11/all"] == NSOrderedSame){
                                                            
                                                            NSMutableArray * array = [[NSMutableArray alloc] initWithArray:[text componentsSeparatedByString:@"*"]];
                                                            
                                                            for(int i =0 ; i < array.count ; i++){
                                                                NSLog(@"- %d : %@ \n",i,[array objectAtIndex:i]);
                                                            }
                                                            if ([[array objectAtIndex:0] compare:@"test"] == NSOrderedSame) {
                                                                control1=1;

                                                                _control.text=@"READY";    }
                                                            
                                                            if ([[array objectAtIndex:2] compare:@"s"] == NSOrderedSame) {
                                                                _engines.text=@"READY";
                                                                engines1=1;
                                                                
                                                                }
                                                            
                                                            if ([[array objectAtIndex:2] compare:@"t"] == NSOrderedSame) {
                                                                _engines.text=@"READY";
                                                                engines1=1;
                                                                
                                                               }
                                                            if ([[array objectAtIndex:2] compare:@""] == NSOrderedSame) {
                                                                _engines.text=@"DONT KNOW";
                                                                engines1=1;
                                                                }
                                                            
                                                    
                                                                
                                                                if ([[array objectAtIndex:5] compare:@"sygnal"] == NSOrderedSame || [[array objectAtIndex:6] compare:@"sygnal"] == NSOrderedSame ) {
                                                                    gps1=1;
                                                                    koniec2=0;
                                                                    
                                                                    _gps.text=@"SIGNAL TOO WEAK";
                                                                }
                                                               float dlugosc3=[[array objectAtIndex:5] floatValue];
                                                                float szerokosc3=[[array objectAtIndex:6] floatValue];
                                                                if ([[array objectAtIndex:5] compare:@"sygnal"] != NSOrderedSame && [[array objectAtIndex:6] compare:@"sygnal"] != NSOrderedSame && dlugosc3!=szerokosc3) {
                                                                    gps1=1;
                                                                    koniec2=0;
                                                                    
                                                                    _gps.text=@"SIGNAL OK";
                                                                }
                                                                
                                                                
                                                                if ([[array objectAtIndex:5] compare:@"brak"] == NSOrderedSame || [[array objectAtIndex:6] compare:@"brak"] == NSOrderedSame ) {
                                                                    gps1=1;
                                                                    koniec2=0;
                                                                    
                                                                    _gps.text=@"TO CHECK";
                                                                }
                                                                
                                                                if ([[array objectAtIndex:1] compare:@"temp"] == NSOrderedSame) {
                                                                    temp1=1;
                                                                    _temp.text=@"20°C";
                                                                    koniec2=3;

                                                                
                                                            }
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            }}}
                                                        
                                                    }];
    
    [dataTask resume];
    
        return TRUE;
}

- (void) applicationDidFinishLaunching:(UIApplication*)application
{
    [self.navigationController setNavigationBarHidden:YES]; 

    [NSThread sleepForTimeInterval:10.0];
}
- (IBAction)DODAJ_PARAGON:(id)sender {
}
- (IBAction)detale:(id)sender {
}
@end
