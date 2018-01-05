//
//  ViewController.h
//  OFICJALNA
//
//  Created by Robert Pudlowski on 02.10.2016.
//  Copyright © 2016 Robert Pudlowski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WidokMenu : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *tablica;
}










- (IBAction)detale:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *label2;

@property (weak, nonatomic) IBOutlet UILabel *temp;
@property (weak, nonatomic) IBOutlet UILabel *engines;
@property (weak, nonatomic) IBOutlet UITableView *table;

@property (weak, nonatomic) IBOutlet UILabel *control;
- (IBAction)ToMapView:(id)sender;
- (IBAction)cam:(id)sender;
- (IBAction)DODAJ_PARAGON:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *camera;
@property (weak, nonatomic) IBOutlet UILabel *gps;
@property (weak, nonatomic) IBOutlet UILabel *BILL_MENUGŁ;



@end

