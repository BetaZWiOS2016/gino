//
//  ViewController.h
//  tableview excercise 0
//
//  Created by user116381 on 3/29/16.
//  Copyright © 2016 user116381. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Expense.h"
#import "TableViewController.h"

@interface ViewController : UIViewController
     <UIPickerViewDataSource, UIPickerViewDelegate>

@property Expense* entry ;
@property NSMutableArray* categories;


@end

