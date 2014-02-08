//
//  ItemCell.h
//  ToDoList
//
//  Created by Nikita Fomin on 08.02.14.
//  Copyright (c) 2014 Nikita Fomin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemCell : UITableViewCell

- (void)configureWithItem:(Item *)item;

@end
