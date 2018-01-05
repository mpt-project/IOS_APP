//
//  Camera.m
//  OFICJALNA
//
//  Created by Robert Pudlowski on 29.10.2016.
//  Copyright © 2016 Robert Pudlowski. All rights reserved.
//

#import "WidokSterowania.h"

@interface WidokSterowania ()

@end

@implementation WidokSterowania
@synthesize speed;
int a=0;
int status=0;
int ip=0;
int speed1=0;
NSTimer * timer;
NSTimer * timer1;
float duration_start=0;
int przerwij;
float duration_stop=0;
int temp=0;
- (void)viewDidLoad {
    [super viewDidLoad];
    UIFont *nowaCzcionka  = [UIFont fontWithName: @"Gotham Light" size:15.0];
    speed.font=nowaCzcionka;
    _controlstatus.font=nowaCzcionka;
    _temperature.font=nowaCzcionka;
    _status.font=nowaCzcionka;
    _mode.font=nowaCzcionka;
    przerwij=0;
    NSString *fullURL = @"http://192.168.4.1/stream";
    NSURL *url1 = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url1];
    [_Web loadRequest:requestObj];
    [self performSelector:@selector(methodA)];


    
}



//funcka metodaA - wywołuje funkcje merodB co 5 sek zeby sie odswiezało
- (void) methodA
{

    //Wywołanie metodyB, co 1 sekundę
    [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self selector:@selector(methodB:) userInfo:nil repeats:YES];
}
int test=0;
int test1=0;
int test2=0;
int test3=0;


- (void) methodB:(NSTimer *)timer
{
    if(przerwij==0){
    
    //***************************************** wywoływanie funkcji do wysyłania zadan GET, która jeśli połączy przypisuje wartość 1
   
        test=0;
      
        if([self sendHTTPGet]==TRUE){
    if (ip==0 ) {
        _controlstatus.text=@"OFFLINE";
            }
    
        ip=0;
    //********************************************* do statusu
    
    if (status==0 ) {
        _status.text=@"OFFLINE";
        
    }
    status=0;
    
   
    if (temp==0 ) {
        _temperature.text=@"OFFLINE";
        
    }
    temp=0;
    
    
    if (speed1==0 ) {
        speed.text=@"OFFLINE";
        
    }
    speed1=0;
    }
    }
    


}

-(BOOL) sendHTTPGet
{
    NSString *str = [NSString stringWithFormat: @"http://192.168.4.11/all"];

    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];


    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];

    NSURL * url = [NSURL URLWithString:str];
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithURL:url
                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
;
                                                        if(error == nil)
                                                        {
                                                            NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                                            
                                                            NSMutableArray * array = [[NSMutableArray alloc] initWithArray:[text componentsSeparatedByString:@"*"]];
                                                            
                                                            for(int i =0 ; i < array.count ; i++){
                                                                NSLog(@"- %d : %@ \n",i,[array objectAtIndex:i]);
                                                            
                                                               if ([[array objectAtIndex:2] compare:@"s"] == NSOrderedSame) {
                                                                    status=1;
                                                                    
                                                                   _status.text=@"STOPPED";    }
                                                                
                                                                if ([[array objectAtIndex:2] compare:@"t"] == NSOrderedSame) {
                                                                    status=1;
                                                                    
                                                                    _status.text=@"STARTED";    }
                                                               
                                                                if ([[array objectAtIndex:0] compare:@"test"] == NSOrderedSame) {
                                                                    ip=1;
                                                                    
                                                                   _controlstatus.text=@"ONLINE";    }
                                                                if ([[array objectAtIndex:1] compare:@"temp"] == NSOrderedSame) {
                                                                    temp=1;
                                                                    
                                                                    _temperature.text=@"20°C";    }
                                                                
                                                               
                                                                
                                                                if ([[array objectAtIndex:7] compare:@"q"] == NSOrderedSame) {
                                                                    speed1=1;
                                                                    
                                                                    speed.text=@"STOPPED";    }
                                                                if ([[array objectAtIndex:7] compare:@"w"] == NSOrderedSame) {
                                                                    speed1=1;
                                                                    
                                                                    speed.text=@"5 %";    }
                                                                if ([[array objectAtIndex:7] compare:@"e"] == NSOrderedSame) {
                                                                    speed1=1;
                                                                    
                                                                    speed.text=@"10%";    }
                                                                if ([[array objectAtIndex:7] compare:@"r"] == NSOrderedSame) {
                                                                    speed1=1;
                                                                    
                                                                    speed.text=@"20%";    }
                                                                if ([[array objectAtIndex:7] compare:@"t"] == NSOrderedSame) {
                                                                    speed1=1;
                                                                    
                                                                    speed.text=@"35%";    }
                                                                if ([[array objectAtIndex:7] compare:@"y"] == NSOrderedSame) {
                                                                    speed1=1;
                                                                    
                                                                    speed.text=@"50%";    }
                                                                if ([[array objectAtIndex:7] compare:@"u"] == NSOrderedSame) {
                                                                    speed1=1;
                                                                    
                                                                    speed.text=@"60%";    }
                                                                if ([[array objectAtIndex:7] compare:@"i"] == NSOrderedSame) {
                                                                    speed1=1;
                                                                    
                                                                    speed.text=@"75%";    }
                                                                if ([[array objectAtIndex:7] compare:@"o"] == NSOrderedSame) {
                                                                    speed1=1;
                                                                    
                                                                    speed.text=@"100%";    }
                                                               }
                                                            
                                                            
                                                                    
                                                                   ;
                                                                
                                                                                                                    
                                                        }
                                                        
                                                    }];
 
    [dataTask resume];
   test=1;
    return TRUE;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
int rob;
-(void)updateProgressstart
{
    duration_start+= 0.1;
    
    _progres_start.progress = (duration_start/5.0); // here 5.0 indicates your required time duration
    
    if (_progres_start.progress == 1)
    {
        
        
        _progres_start.progress=0;
        duration_start=0;
        [timer1 invalidate];
        
        timer1 = nil;
        
    }
}

-(void)updateProgressstop
{
    duration_stop += 0.1;
    
    _progres_stop.progress = (duration_stop/5.0); // here 5.0 indicates your required time duration
    
    if (_progres_stop.progress == 1)
    {
        
        _progres_stop.progress=0;
        duration_stop=0;
        [timer invalidate];
        
        timer = nil;
        
    }
}


- (IBAction)stop:(id)sender {
    if(_progres_stop.progress==0 && _progres_start.progress==0){
        
        NSString *str4 = [NSString stringWithFormat: @"http://192.168.4.11/0"];
        
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

    
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateProgressstop) userInfo:nil repeats:YES];;
        
    
    }
    
}






- (IBAction)start:(id)sender {
    if(_progres_start.progress==0 && _progres_stop.progress==0){
        
        NSString *str3 = [NSString stringWithFormat: @"http://192.168.4.11/1"];
        
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

    
    timer1 = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateProgressstart
) userInfo:nil repeats:YES];;
        
    }
}

- (IBAction)DoMenu:(id)sender {
    NSString *fullURL = @"http://192.168.4.1/test";
    NSURL *url1 = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url1];
    [_Web loadRequest:requestObj];
    

    przerwij=1;
    [self performSegueWithIdentifier:@"DoMenuGL" sender:self];

}
- (IBAction)SwitchMain:(id)sender {
    if(_switchRR.on){
    _mode.text=@"NORMAL";
    }else{
        _mode.text=@"EXTRA";

    }
}

@end
