//
//  ItemsTableController.h
//  ToDoList
//
//  Created by Nikita Fomin on 08.02.14.
//  Copyright (c) 2014 Nikita Fomin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskCreateOrEditViewController.h"
#import "ItemCell.h"

@interface ItemsTableController : UITableViewController <UIAlertViewDelegate, TaskCreateOrEditViewControllerDelegate>

- (IBAction)addFolderClick;

@end
