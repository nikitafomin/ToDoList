//
//  TaskCreateOrEditViewController.h
//  ToDoList
//
//  Created by Nikita Fomin on 09.02.14.
//  Copyright (c) 2014 Nikita Fomin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FolderSelectTableViewController.h"

@class TaskCreateOrEditViewController;

@protocol TaskCreateOrEditViewControllerDelegate <NSObject>

@optional
- (void)taskCreateOrEditViewControllerDidCancel:(TaskCreateOrEditViewController *)controller;
- (void)taskCreateOrEditViewController:(TaskCreateOrEditViewController *)controller didCreateItem:(Item *)item;
- (void)taskCreateOrEditViewController:(TaskCreateOrEditViewController *)controller didChangeItem:(Item *)item;

@end

@interface TaskCreateOrEditViewController : UIViewController <FolderSelectTableViewControllerDelegate>

@property (nonatomic, strong) IBOutlet UITextField *itemNameTextField;
@property (nonatomic, strong) IBOutlet UIButton *folderSelectButton;

@property (nonatomic, weak) id <TaskCreateOrEditViewControllerDelegate> delegate;

@property (nonatomic, strong) Item *item;

@end
