//
//  FilterViewController.m
//  tableview excercise 0
//
//  Created by user116381 on 3/31/16.
//  Copyright © 2016 user116381. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *categoryPicker;
@property (weak, nonatomic) IBOutlet UIButton *selectbutton;
@property (weak, nonatomic) IBOutlet UIButton *cancelbutton;
@property (weak, nonatomic) RLMRealm* realm;
@property (weak,nonatomic) DataManager* datamanager;
@property (assign) NSInteger mRow;

@end

@implementation FilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _realm = [RLMRealm defaultRealm];
    _categoryPicker.dataSource = self;
    _categoryPicker.delegate = self;
    _datamanager = [DataManager sharedManager];

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

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [_categories count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    ExpenseCategory* rowitem = _categories[row];
    return rowitem.categoryDescription;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _mRow = row;
}

- (IBAction)ClickSelectbutton:(id)sender {
    NSString* filter;
    filter = @"categoryID='";
    filter = [filter stringByAppendingString:[_categories[_mRow] id]];
    filter = [filter stringByAppendingString:@"'"];
    
    [_datamanager setExpenseFilter:filter];
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)ClickCancelbutton:(id)sender {
    NSString* filter = @"";
    [_datamanager setExpenseFilter:filter];
    [self.navigationController popViewControllerAnimated:YES];

}




@end
