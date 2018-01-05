//
//  TableViewController.m
//  OFICJALNA
//
//  Created by Robert Pudlowski on 05.01.2018.
//  Copyright © 2018 Robert Pudlowski. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
{
    NSMutableArray *tablica;

    
}
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tablica = [[NSMutableArray alloc]initWithObjects: @"Audi A6",@"Audi A6",@"Audi A6",nil];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    UIFont *nowaCzcionka2  = [UIFont fontWithName: @"Luckiest Guy" size:20.0];
    

    _il1.text=@"6 mies.";
    _il1.font=nowaCzcionka2;
    _il1.layer.cornerRadius=5.0;
    _il1.layer.masksToBounds=YES;
    
    
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tableView:(UITableView *)tableView
accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    [self performSegueWithIdentifier:@"DoC2" sender:nil];
}
#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
    // This is just Programatic method you can also do that by xib !
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tablica count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *aCell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    // Configure the cell...
  
    //aCell.textLabel.text=[NSString stringWithFormat:@"%ld", (long)indexPath.row];
    aCell.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    aCell.layer.shadowOffset = CGSizeMake(0, 2);
    aCell.layer.shadowOpacity = 0.8;
    aCell.layer.shadowRadius = 3;
    aCell.layer.masksToBounds = NO;
    aCell.layer.cornerRadius=4.0;
    return aCell;
    

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



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
