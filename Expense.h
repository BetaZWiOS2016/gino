//
//  Expense.h
//  tableview excercise 0
//
//  Created by user116381 on 3/29/16.
//  Copyright © 2016 user116381. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExpenseCategory.h"

@interface Expense : NSObject

@property (assign) ExpenseCategory* category;
@property (assign) NSDate* datum;
@property (assign) float amount;


@end
