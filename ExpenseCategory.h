//
//  ExpenseCategory.h
//  tableview excercise 0
//
//  Created by user116381 on 3/29/16.
//  Copyright © 2016 user116381. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

//@interface ExpenseCategory : NSObject
@interface ExpenseCategory : RLMObject

@property (assign)NSString* id;
@property (strong, nonatomic)NSString* categoryDescription;

-(NSArray *) relatedExpenses;

@end

RLM_ARRAY_TYPE(ExpenseCategory);
