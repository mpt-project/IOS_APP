//
//  MapaViewController.m
//  OFICJALNA
//
//  Created by Robert Pudlowski on 02.10.2016.
//  Copyright © 2016 Robert Pudlowski. All rights reserved.
//
//#import <NMAKit/NMAKit.h>

#import "WidokMapy.h"
#import <GoogleMaps/GoogleMaps.h>

int a1, b1, pol;
int abc=0;
float dlugosc=0;
float szerokosc=0;
NSString *dlugosc1, *szerokosc1;
@interface WidokMapy ()
@property (strong, nonatomic) IBOutlet GMSMapView *MAPKA;

@end

@implementation WidokMapy

- (void)viewDidLoad {
    [super viewDidLoad];
    a1=0;
    b1=0;
     self.navigationItem.title=@"MAP";
    [_MAPKA setHidden:YES];
[self performSelector:@selector(methodA2)];
    ////////////// wlaczanie GPS /////
        
    
    
   
    
    
    
    
    
    ////////////////////////////////
    
    UIFont *nowaCzcionka  = [UIFont fontWithName: @"Gotham Light" size:17.0];
    UIFont *CzcionkaUPDATE= [UIFont fontWithName: @"Gotham Light" size:12.0];

    _gps_status.font=nowaCzcionka;
    _Update.font=CzcionkaUPDATE;
    _loading.font=nowaCzcionka;
    
    
   /* GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                            longitude:151.20
                                                                 zoom:6];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.myLocationEnabled = YES;
  //  [_Mapka addSubview:mapView];

   

    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
    marker.title = @"Sydney";
    marker.snippet = @"Australia";
    marker.map = _Map;
    self.Map.camera = camera;

     self.Map= mapView;
    // Do any additional setup after loading the view.

    
    */

/*
    [NMAMapView class];
    //set geo center
    NMAGeoCoordinates *geoCoordCenter =
    [[NMAGeoCoordinates alloc] initWithLatitude:49.260327 longitude:-123.115025];
    [self.MapA setGeoCenter:geoCoordCenter withAnimation:NMAMapAnimationNone];
    self.MapA.copyrightLogoPosition = NMALayoutPositionBottomCenter;
    
    //set zoom level
    self.MapA.zoomLevel = 13.2;
*/

    
    
  /*
    [NMAMapView class];
    //set geo center
    NMAGeoCoordinates *geoCoordCenter =
    [[NMAGeoCoordinates alloc] initWithLatitude:dlugosc longitude:szerokosc];
    [self.Mapa setGeoCenter:geoCoordCenter withAnimation:NMAMapAnimationNone];
    _Mapa.positionIndicator.visible = YES;

    self.Mapa.copyrightLogoPosition = NMALayoutPositionBottomCenter;
    
    //set zoom level
    self.Mapa.zoomLevel = 13.2;
    self.Mapa.positionIndicator.visible = YES;*/
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) methodA2
{  if(a1==1){return;}
    //co jedną sekunde następuje wywołanie metodyB2
    [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self selector:@selector(methodB2:) userInfo:nil repeats:YES];
}

- (void) methodB2:(NSTimer *)timer
{
    if(b1==0){pol=1;
        
        if([self pobierz]){

            NSLog(@"TEST  sz%d\n",abc);
            if(abc==1){
                [_MAPKA setHidden:NO];

                [_loading setHidden:YES];
                [_spinner stopAnimating];
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:50.0964318
                                                                longitude:19.9868488
                                                                     zoom:16];
        GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        mapView.myLocationEnabled = YES;
        [self.MAPKA setCamera:camera];
        
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake(50.0964318, 19.9868488);
        marker.title = @"ROPERIDER";
        marker.snippet = @"Helo, I'm here and I'm working.";
        marker.map = _MAPKA;
                _MAPKA= mapView;}
            }
            }
    }

-(BOOL) pobierz
{

    NSString *str10 = [NSString stringWithFormat: @"http://192.168.4.11/GPS"];
    
    NSURLSessionConfiguration *defaultConfigObject10 = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    
    NSURLSession *defaultSession10 = [NSURLSession sessionWithConfiguration: defaultConfigObject10 delegate: self delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL * url10 = [NSURL URLWithString:str10];
    NSURLSessionDataTask * dataTask10 = [defaultSession10 dataTaskWithURL:url10
                                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                            ;
                                                            if(error == nil)
                                                            {
                                                                NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                                                
                                                                NSMutableArray * array = [[NSMutableArray alloc] initWithArray:[text componentsSeparatedByString:@"*"]];
                                                                
                                                                for(int i =0 ; i < array.count ; i++){
                                                                    NSLog(@"- %d : %@ \n",i,[array objectAtIndex:i]);
                                                                    pol=0;
                                                                    
                                                                    pol=0;
                                                                    dlugosc=[[array objectAtIndex:0] floatValue];
                                                                    szerokosc=[[array objectAtIndex:1] floatValue];
                                                                    if ([[array objectAtIndex:0] compare:@"sygnal"] == NSOrderedSame || [[array objectAtIndex:1] compare:@"sygnal"] == NSOrderedSame || [[array objectAtIndex:1] compare:@"0.000000"] == NSOrderedSame || [[array objectAtIndex:0] compare:@"0.000000"] == NSOrderedSame || dlugosc==0.000000 || szerokosc==0.000000 || dlugosc==szerokosc) {
                                                                        abc=0;
                                                                        _gps_status.text=@"SIGNAL TOO WEAK";
                                                                       
                                                                    
                                                                    }else{
                                                                        _gps_status.text=@"SIGNAL OK";
                                                                        dlugosc=[[array objectAtIndex:0] floatValue];
                                                                        abc=1;
                                                                        
                                                                        szerokosc=[[array objectAtIndex:1] floatValue];
                                                                        
                                                                        
                                                                    }
                                                                    pol=0;
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                }
                                                            }
                                                            
                                                        }];
    
    [dataTask10 resume];
    
    
    return TRUE;

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(BOOL) OFF1

{
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
return TRUE;
    
}


- (IBAction)ToMainMenu:(id)sender {
    if([self OFF1]){
    [self performSegueWithIdentifier:@"GPStoMENU" sender:self];
    a1=1;
        b1=1;}
    ///////////////wylaczanie GPS///////////////
    
////////////////////////////
    
}

@end
