//
//  TableViewController.h
//  OFICJALNA
//
//  Created by Robert Pudlowski on 05.01.2018.
//  Copyright © 2018 Robert Pudlowski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *il1;
@property (weak, nonatomic) IBOutlet UILabel *test;
@property (weak, nonatomic) IBOutlet UIImageView *obrazek1;
@property (strong, nonatomic) IBOutlet UITableView *table;

@end
