//
//  ExpenseCategory.m
//  tableview excercise 0
//
//  Created by user116381 on 3/29/16.
//  Copyright © 2016 user116381. All rights reserved.
//

#import "ExpenseCategory.h"

@interface ExpenseCategory()

@end

@implementation ExpenseCategory

@synthesize description;

-(NSArray *)relatedExpenses{
    return [self linkingObjectsOfClass:@"Expense" forProperty:@"ExpenseCategory"];
}

@end
