//
//  FilterViewController.h
//  tableview excercise 0
//
//  Created by user116381 on 3/31/16.
//  Copyright © 2016 user116381. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import "Expense.h"
#import "TableViewController.h"

@interface FilterViewController : UIViewController
        <UIPickerViewDataSource, UIPickerViewDelegate>

@property NSMutableArray* categories;

@end
