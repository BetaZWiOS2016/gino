//
//  TableViewController.m
//  tableview excercise 0
//
//  Created by user116381 on 3/29/16.
//  Copyright © 2016 user116381. All rights reserved.
//

#import "TableViewController.h"


@interface TableViewController ()

//@property NSMutableArray* data;
//@property NSMutableArray* dataCategories;
@property DataManager* datamanager;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *Addbutton;

@end

@implementation TableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _datamanager = [DataManager sharedManager];
    _sender = [[SenderEntry alloc] init];
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
    
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

    return [[_datamanager getExpenseList] count];
}


- (TableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExpenseCell" forIndexPath:indexPath];
    
    // Configure the cell..
    [cell configureCell: [_datamanager getExpense:indexPath.row]
                    row: indexPath.row];
    
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [_datamanager deleteExpense:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
       
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated: YES];
   
    
    _sender.entry = [_datamanager getExpense:indexPath.row];
    _sender.categories = [_datamanager getExpenseCategoryList];
    [self performSegueWithIdentifier:@"showDetail" sender:_sender];
    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ( [[segue identifier] isEqualToString:@"showDetail"]) {
        
        SenderEntry* senderentry = (SenderEntry*)sender;
        
        //NSLog(@"%@", senderentry);
        
        ViewController* vc = (ViewController*)[segue destinationViewController];
        vc.entry = senderentry.entry;
        vc.categories = senderentry.categories;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
- (IBAction)ClickADDbutton:(id)sender {
    
    Expense* entry = [_datamanager createExpense:1 Expensedatum:@"" Expensedescription:@""  ExpenseAmount:0];
    
    NSInteger row = [_datamanager addExpense:entry];
    _sender.entry = entry;
    _sender.categories = [_datamanager getExpenseCategoryList];
    [self performSegueWithIdentifier:@"showDetail" sender:_sender];
    
    
}



@end
