//
//  FolderSelectTableViewController.h
//  ToDoList
//
//  Created by Nikita Fomin on 09.02.14.
//  Copyright (c) 2014 Nikita Fomin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FolderSelectCell.h"

@class FolderSelectTableViewController;

@protocol FolderSelectTableViewControllerDelegate <NSObject>

@optional
- (void)folderSelectTableViewControllerDidCancel:(FolderSelectTableViewController *)controller;
- (void)folderSelectTableViewController:(FolderSelectTableViewController *)controller didSelectFolder:(Folder *)folder;

@end

@interface FolderSelectTableViewController : UITableViewController

@property (nonatomic, weak) id <FolderSelectTableViewControllerDelegate> delegate;

@end
