//
//  ViewController.m
//  tableview excercise 0
//
//  Created by user116381 on 3/29/16.
//  Copyright © 2016 user116381. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *categoryPicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *datumPicker;
@property (weak, nonatomic) IBOutlet UITextField *descriptionText;
@property (weak, nonatomic) IBOutlet UITextField *amountText;

@property (weak, nonatomic) IBOutlet UIButton *OKbutton;
@property (weak, nonatomic) IBOutlet UIButton *CANCELbutton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *ADDbutton;

@property RLMRealm* realm;
@property DataManager* datamanager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _realm = [RLMRealm defaultRealm];
    _categoryPicker.dataSource = self;
    _categoryPicker.delegate = self;
    _datamanager = [DataManager sharedManager];
    NSInteger index = [_datamanager getExpenseCategoryRow: _entry.categoryID];
    [_categoryPicker selectRow:index inComponent:0 animated:YES ];
    
    _datumPicker.date = _entry.datum;
    _descriptionText.text = _entry.Expensedescription;
    _amountText.text = [NSString stringWithFormat:@"%.2f", _entry.amount];
    
}

- (void) viewWillAppear:(BOOL)animated
{
    _categories = [_datamanager getExpenseCategoryList];
    [[self categoryPicker] reloadAllComponents];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    self.navigationItem.rightBarButtonItem.title = @"";
    //self.navigationItem.rightBarButtonItem.image;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [_categories count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}



-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    ExpenseCategory* rowitem = _categories[row];
    return rowitem.categoryDescription;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    self.navigationItem.rightBarButtonItem.enabled = YES;
    self.navigationItem.rightBarButtonItem.title = @"ADD";
    [_realm beginWriteTransaction];
    _entry.categoryID = [_categories[row] id];
    [_realm commitWriteTransaction];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)ClickOKbutton:(id)sender {
    
    [_realm beginWriteTransaction];
    _entry.datum = _datumPicker.date;
    _entry.Expensedescription = _descriptionText.text;
    _entry.amount = [_amountText.text floatValue];
    [_realm commitWriteTransaction];

    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)ClickCANCELbutton:(id)sender {
      [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)ClickADDbutton:(id)sender {
    
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
