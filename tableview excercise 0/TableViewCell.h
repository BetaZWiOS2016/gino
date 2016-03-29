//
//  TableViewCell.h
//  tableview excercise 0
//
//  Created by user116381 on 3/29/16.
//  Copyright © 2016 user116381. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Expense.h"

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *categoryText;
@property (weak, nonatomic) IBOutlet UILabel *datumText;
@property (weak, nonatomic) IBOutlet UILabel *amountText;

-(void) configureCell: (Expense*) expense ;

@end


