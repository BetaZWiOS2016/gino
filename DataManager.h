//
//  DataManager.h
//  tableview excercise 0
//
//  Created by user116381 on 3/30/16.
//  Copyright © 2016 user116381. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Expense.h"

@interface DataManager : NSObject {
    NSMutableArray* data;
    NSMutableArray* categories;
}
@property (nonatomic, retain) NSMutableArray* data;
@property (nonatomic, retain) NSMutableArray* categories;

+(id)sharedManager;
-(ExpenseCategory*) createExpenseCategory:  (NSInteger) categoryID
                      CategoryDescription: (NSString*) description;
- (ExpenseCategory*) getExpenseCategory: (NSInteger) categoryID;
- (NSMutableArray*) getExpenseCategoryList;
- (Expense*) createExpense: (NSInteger) categoryID
             Expensedatum: (NSString*) datumString
        Expensedescription: (NSString*) Edescription
             ExpenseAmount: (float) amount;
- (Expense*) getExpense: (NSInteger) row;
- (void) setExpense : (NSInteger) row
            newValue: (Expense*) entry;
- (NSInteger ) addExpense: (Expense*) entry;
- (void) deleteExpense: (NSInteger) row;
- (NSMutableArray*) getExpenseList;

@end
