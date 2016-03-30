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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _categoryPicker.dataSource = self;
    _categoryPicker.delegate = self;
    [_categoryPicker selectRow:[[_entry category] id] inComponent:0 animated:YES ];
    
    _datumPicker.date = _entry.datum;
    _descriptionText.text = _entry.Expensedescription;
    _amountText.text = [NSString stringWithFormat:@"%.2f", _entry.amount];
    
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
    _entry.category = _categories[row];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)ClickOKbutton:(id)sender {
    
    _entry.datum = _datumPicker.date;
    _entry.Expensedescription = _descriptionText.text;
    _entry.amount = [_amountText.text floatValue];

    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)ClickCANCELbutton:(id)sender {
      [self.navigationController popViewControllerAnimated:YES];
}



@end
