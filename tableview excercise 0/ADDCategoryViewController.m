//
//  ADDCategoryViewController.m
//  tableview excercise 0
//
//  Created by user116381 on 4/1/16.
//  Copyright © 2016 user116381. All rights reserved.
//

#import "ADDCategoryViewController.h"

@interface ADDCategoryViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mDescription;
@property (weak, nonatomic) IBOutlet UIButton *mOKbutton;
@property (weak, nonatomic) IBOutlet UIButton *mCANCELbutton;
@property (weak, nonatomic) NSMutableArray* categories;
@property (weak, nonatomic) DataManager* datamanager;
@property (weak,nonatomic) RLMRealm* realm;

@end

@implementation ADDCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _realm =[RLMRealm defaultRealm];
    _datamanager = [DataManager sharedManager];
    _categories = [_datamanager getExpenseCategoryList];
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
- (IBAction)ClickOKbutton:(id)sender {
    
    [_datamanager createExpenseCategory:_mDescription.text];
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)ClickCANCELbutton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
