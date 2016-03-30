//
//  TableViewCell.m
//  tableview excercise 0
//
//  Created by user116381 on 3/29/16.
//  Copyright © 2016 user116381. All rights reserved.
//

#import "TableViewCell.h"


@implementation TableViewCell


- (void)awakeFromNib {
    // Initialization code

    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) configureCell: (Expense*) expense
                  row: (NSInteger) row
{
    
    if (row % 2 == 0) {
        self.backgroundColor = [UIColor colorWithRed:0.90 green:0.77 blue:0.77 alpha:1.0];
    } else {
        self.backgroundColor = [UIColor colorWithRed:0.81 green:0.58 blue:0.58 alpha:1.0];    }
    self.categoryText.text = [[expense category] categoryDescription ];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale currentLocale];
    dateFormatter.dateFormat = @"dd/MM/yyyy hh:mm";
    self.datumText.text = [dateFormatter stringFromDate:expense.datum];
    self.descriptionText.text = expense.Expensedescription;

    self.amountText.text = [NSString stringWithFormat:@"%.1f", expense.amount];
    
}


@end
