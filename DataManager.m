//
//  DataManager.m
//  tableview excercise 0
//
//  Created by user116381 on 3/30/16.
//  Copyright © 2016 user116381. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

@synthesize data;
@synthesize categories;


#pragma mark Singleton Methods

+ (id)sharedManager {
    static DataManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        [self createData];
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

- (ExpenseCategory*) createExpenseCategory:  (NSInteger) categoryID
                        CategoryDescription: (NSString*) description
{
    ExpenseCategory* element = [[ExpenseCategory alloc] init];
    [element setId:categoryID];
    [element setCategoryDescription:description];
    return element;
}

- (ExpenseCategory*) getExpenseCategory: (NSInteger) categoryID
{
    for (int i=0; i < [categories count]; i++) {
        if ( [categories[i] id] == categoryID) {return categories[i];}
    }
    return nil;
}


- (NSMutableArray*) getExpenseCategoryList {
    return categories;
}



- (Expense*) createExpense: (NSInteger) categoryID
              Expensedatum: (NSString*) datumString
        Expensedescription: (NSString*) Edescription
             ExpenseAmount: (float) amount
{
    Expense* element = [[Expense alloc] init];
    NSDate *datum;
    if ([datumString length] == 0) {
        datum = [NSDate date];
    } else {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [NSLocale currentLocale];
        dateFormatter.dateFormat = @"dd/MM/yyyy";
        datum = [dateFormatter dateFromString:datumString];
    }
    
    [element setAmount:amount];
    [element setDatum:datum];
    [element setExpensedescription:Edescription ];
    [element setCategory: [self getExpenseCategory:categoryID]];
    return element;
    
}

- (Expense*) getExpense: (NSInteger) row
{
    return data[row];
}

- (void) setExpense : (NSInteger) row
            newValue: (Expense*) entry
{
    if (row >= 0 && row < [data count] ) {
      data[row] = entry;
    }
}

- (NSInteger ) addExpense: (Expense*) entry
{
    [data addObject:entry];
    return [data count] -1;
}

- (void) deleteExpense: (NSInteger) row
{
    if (row >= 0 && row < [data count] ) {
        [data removeObjectAtIndex:row];
    }

}

- (NSMutableArray*) getExpenseList {
    return data;
}


- (void) createData
{
    
    data =[[NSMutableArray alloc]init];
    categories = [[NSMutableArray alloc]init];
    
    [categories addObject:
     [self createExpenseCategory:0 CategoryDescription:@"One"]];
    [categories addObject:
     [self createExpenseCategory:1 CategoryDescription:@"Two"]];
    [categories addObject:
     [self createExpenseCategory:2 CategoryDescription:@"Three"]];
    
    
    [data addObject: [self createExpense:1 Expensedatum:@"01/01/2016" Expensedescription:@"blabla" ExpenseAmount:10.2]];
    [data addObject: [self createExpense:2 Expensedatum:@"02/01/2016" Expensedescription:@"dudu" ExpenseAmount:9.5]];
}

@end