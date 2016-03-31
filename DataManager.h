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
- (ExpenseCategory*) createExpenseCategory: (NSString*) description;
- (ExpenseCategory*) getExpenseCategory: (NSString*) categoryID;
- (NSInteger) getExpenseCategoryRow: (NSString*) categoryID;
- (NSMutableArray*) getExpenseCategoryList;
- (Expense*) createExpense: (NSString*) categoryID
             Expensedatum: (NSString*) datumString
        Expensedescription: (NSString*) Edescription
             ExpenseAmount: (float) amount;
- (Expense*) getExpense:(NSInteger) row;
- (Expense*) getExpenseFromID: (NSString*) id;
- (NSInteger)getExpenseRow: (NSString*) expenseID;
- (void)    setExpense : (Expense*) entry;
- (NSInteger ) addExpense: (Expense*) entry;
- (void) deleteExpenseFromID: (NSString*) id;
- (void) deleteExpense: (NSInteger) row;
- (void) setExpenseFilter: (NSString*) filter;
- (NSMutableArray*) getExpenseList;

@end
