//
//  Expense.h
//  tableview excercise 0
//
//  Created by user116381 on 3/29/16.
//  Copyright © 2016 user116381. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import "ExpenseCategory.h"

@interface Expense : RLMObject

@property (assign) NSString* id;
@property (strong, nonatomic) NSString* categoryID;
@property (strong, nonatomic) NSDate* datum;
@property (strong, nonatomic) NSString* Expensedescription;
@property (assign) float amount;

@end

RLM_ARRAY_TYPE(Expense);
