//
//  TableViewController.m
//  tableview excercise 0
//
//  Created by user116381 on 3/29/16.
//  Copyright © 2016 user116381. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"

@interface TableViewController ()

@property NSMutableArray* data;
@property NSMutableArray* dataCategories;

@end

@implementation TableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self createData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_data count];
}


- (TableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExpenseCell" forIndexPath:indexPath];
    
    // Configure the cell..
    [cell configureCell: _data[indexPath.row]];
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated: YES];
    [self performSegueWithIdentifier:@"showDetail" sender:_data[indexPath.row]];
    
}


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

- (ExpenseCategory*) createExpenseCategory:  (NSInteger) categoryID
                        ExpenseDescription: (NSString*) description
{
    ExpenseCategory* element = [[ExpenseCategory alloc] init];
    [element setId:categoryID];
    [element setCategoryDescription:description];
    return element;
}


- (Expense*) createExpense: (NSInteger) categoryID
          Expensedatum: (NSString*) datumString
          ExpenseAmount: (float) amount
{
    Expense* element = [[Expense alloc] init];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale currentLocale];
    dateFormatter.dateFormat = @"dd/MM/yyyy";
    NSDate *datum = [dateFormatter dateFromString:datumString];
    
    [element setAmount:amount];
    [element setDatum:datum];
    [element setCategory:_dataCategories[categoryID]];
    return element;
    
}

- (void) createData
{
    
    _data =[[NSMutableArray alloc]init];
    _dataCategories = [[NSMutableArray alloc]init];
    
    [_dataCategories addObject:
     [self createExpenseCategory:1 ExpenseDescription:@"One"]];
    [_dataCategories addObject:
     [self createExpenseCategory:2 ExpenseDescription:@"Two"]];
    [_dataCategories addObject:
     [self createExpenseCategory:3 ExpenseDescription:@"Three"]];
    
    [_data addObject: [self createExpense:1 Expensedatum:@"01/01/2016" ExpenseAmount:10.2]];
    [_data addObject: [self createExpense:1 Expensedatum:@"02/01/2016" ExpenseAmount:9.5]];
}


@end
