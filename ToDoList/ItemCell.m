//
//  ItemCell.m
//  ToDoList
//
//  Created by Nikita Fomin on 08.02.14.
//  Copyright (c) 2014 Nikita Fomin. All rights reserved.
//

#import "ItemCell.h"

@implementation ItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithItem:(Item *)item
{
    [[self textLabel] setText:item.name];
}

@end
