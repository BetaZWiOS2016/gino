//
//  SenderEntry.h
//  tableview excercise 0
//
//  Created by user116381 on 3/30/16.
//  Copyright © 2016 user116381. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Expense.h"

@interface SenderEntry : NSObject
@property (strong, nonatomic) Expense* entry;
@property (strong,nonatomic) NSMutableArray* categories;
@end
