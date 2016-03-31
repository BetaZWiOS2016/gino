//
//  DataManager.m
//  tableview excercise 0
//
//  Created by user116381 on 3/30/16.
//  Copyright © 2016 user116381. All rights reserved.
//

#import "DataManager.h"

@interface DataManager()

@property RLMArray* rCategories;
@property RLMArray* rExpenses;
@property RLMRealm* realm ;
@property NSPredicate* expensefilter;

@end


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
    _realm =  [RLMRealm defaultRealm];
    if (self = [super init]) {
        [self createData];
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

- (ExpenseCategory*) createExpenseCategory:  (NSString*) description
{
    [_realm beginWriteTransaction];
     ExpenseCategory* element = [[ExpenseCategory alloc] init];
    [element setId: [[NSUUID UUID] UUIDString]];
    [element setCategoryDescription:description];
    [_realm addObject:element];
    [_realm commitWriteTransaction];
    return element;
}

- (ExpenseCategory*) getExpenseCategory: (NSString*) categoryID
{
//    for (int i=0; i < [categories count]; i++) {
//        if ( [categories[i] id] == categoryID) {return categories[i];}
//    }
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"id = %@ ", categoryID];
    RLMResults<ExpenseCategory *>  *entry = [ExpenseCategory objectsWithPredicate:pred] ;
    if (entry.count > 0) { return entry[0];  }
    return nil;
}

- (NSInteger) getExpenseCategoryRow: (NSString*) categoryID
{
    for (int i=0; i < [categories count]; i++) {
        if ( [[categories[i] id] isEqualToString:categoryID]) {return i;}
    }
    return -1;
}


- (NSMutableArray*) getExpenseCategoryList {
    //categories = [[NSMutableArray alloc]init];
    [categories removeAllObjects];
    RLMResults<ExpenseCategory *>  *entry =
            [[ExpenseCategory allObjects ] sortedResultsUsingProperty:@"categoryDescription" ascending:YES];
    if (entry.count > 0) {
        for (ExpenseCategory* ec in entry) {
            [categories addObject:ec];
        }
    } else { categories = nil;}
    return categories;
}



- (Expense*) createExpense: (NSString*) categoryID
              Expensedatum: (NSString*) datumString
        Expensedescription: (NSString*) Edescription
             ExpenseAmount: (float) amount
{
    [_realm beginWriteTransaction];
    Expense* element = [[Expense alloc] init];
    [element setId:[[NSUUID UUID] UUIDString]];
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
    [element setCategoryID: categoryID];
    [_realm addObject:element];
    [_realm commitWriteTransaction];
    return element;
    
}

- (NSInteger ) addExpense: (Expense*) entry
{
    //[data addObject:entry];
    [_realm beginWriteTransaction];
    [_realm addObject:entry];
    [_realm commitWriteTransaction];
    [self getExpenseList];
    return [data count] ;
}

- (Expense*) getExpenseFromID: (NSString*) id
{
    //
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"id = %s ", id];
    RLMResults<Expense *>  *entry = [Expense objectsWithPredicate:pred] ;
    if (entry.count > 0) { return entry[0];  }
    return nil;
}

- (Expense*) getExpense:(NSInteger) row
{
    return data[row];
}

- (NSInteger)getExpenseRow: (NSString*) expenseID
{
    for (int i=0; i < [data count]; i++) {
        if ( [data[i] id] == expenseID) {return i;}
    }
    return -1;
}

- (void) setExpense : (Expense*) entry
{
//    if (row >= 0 && row < [data count] ) {
//      data[row] = entry;
//    }
    [_realm beginWriteTransaction];
    [_realm addOrUpdateObject:entry];
    [_realm commitWriteTransaction];
}


- (void) deleteExpenseFromID: (NSString*) id
{
//    if (row >= 0 && row < [data count] ) {
//        [data removeObjectAtIndex:row];
//    }
    Expense* entry = [self getExpenseFromID:id];
    [_realm beginWriteTransaction];
    [_realm deleteObjects:entry];
    [_realm commitWriteTransaction];
    [self getExpenseList];
}

- (void) deleteExpense: (NSInteger) row
{
    if (row >= 0 && row < [data count] ) {
        Expense* entry = [self getExpense:row];
        [data removeObjectAtIndex:row];
        [_realm beginWriteTransaction];
        [_realm deleteObject:entry];
        [_realm commitWriteTransaction];
        //[self getExpenseList];
    }
}

- (void) setExpenseFilter: (NSString*) filter
{
    if (filter.length == 0) { _expensefilter = nil;}
    else {_expensefilter = [NSPredicate predicateWithFormat:filter];}
}

- (NSMutableArray*) getExpenseList {
    [data removeAllObjects];
    RLMResults<Expense *>  *entry ;
    if (_expensefilter== nil) { entry = [[Expense allObjects ] sortedResultsUsingProperty:@"datum" ascending:YES];}
    else { entry = [[Expense objectsWithPredicate:_expensefilter] sortedResultsUsingProperty:@"datum" ascending:YES ];}
    if (entry.count > 0) {
        for (Expense* ec in entry) {
            [data addObject:ec];
        }
    } else { }
 
    return data;
}


- (void) createData
{
    
    data =[[NSMutableArray alloc]init];
    categories = [[NSMutableArray alloc]init];
    _expensefilter = nil;
    
    
//    [_realm beginWriteTransaction];
//    [_realm deleteAllObjects];
//    [_realm commitWriteTransaction];
    
    RLMResults<Expense *>  *entry = [ExpenseCategory allObjects] ;
    if (entry.count == 0) {
        [categories addObject:[self createExpenseCategory:@"One"]];
        [categories addObject:[self createExpenseCategory:@"Two"]];
        [categories addObject:[self createExpenseCategory:@"Three"]];
    
        [data addObject: [self createExpense:[categories[0] id ] Expensedatum:@"01/01/2016" Expensedescription:@"blabla" ExpenseAmount:10.2]];
        [data addObject: [self createExpense:[categories[1] id ] Expensedatum:@"02/01/2016" Expensedescription:@"dudu" ExpenseAmount:9.5]];
    }
    
    [self getExpenseCategoryList];
    [self getExpenseList];
}

@end