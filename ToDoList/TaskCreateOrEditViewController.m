//
//  TaskCreateOrEditViewController.m
//  ToDoList
//
//  Created by Nikita Fomin on 09.02.14.
//  Copyright (c) 2014 Nikita Fomin. All rights reserved.
//

#import "TaskCreateOrEditViewController.h"

@interface TaskCreateOrEditViewController ()
{
    Folder *_selectedFolder;
}

@end

@implementation TaskCreateOrEditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if (_item) {
        [_itemNameTextField setText:_item.name];
        _selectedFolder = _item.folder;
        [_folderSelectButton setTitle:_selectedFolder.name forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)doneClick
{
    if (_item) {
        if ([_delegate respondsToSelector:@selector(taskCreateOrEditViewController:didChangeItem:)]) {
            [_item setName:_itemNameTextField.text];
            [_item setFolder:_selectedFolder];
            [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
            [_delegate taskCreateOrEditViewController:self didChangeItem:_item];
        }
    } else {
        if ([_delegate respondsToSelector:@selector(taskCreateOrEditViewController:didCreateItem:)]) {
            _item = [Item MR_createEntity];
            [_item setName:_itemNameTextField.text];
            [_item setFolder:_selectedFolder];
            [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
            [_delegate taskCreateOrEditViewController:self didCreateItem:_item];
        }
    }
}

- (IBAction)cancelClick
{
    if ([_delegate respondsToSelector:@selector(taskCreateOrEditViewControllerDidCancel:)]) {
        [_delegate taskCreateOrEditViewControllerDidCancel:self];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ToFolderSelect"]) {
        FolderSelectTableViewController *controller = [segue destinationViewController];
        [controller setDelegate:self];
    }
}

#pragma mark - Folder select view controller delegate

- (void)folderSelectTableViewControllerDidCancel:(FolderSelectTableViewController *)controller
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)folderSelectTableViewController:(FolderSelectTableViewController *)controller didSelectFolder:(Folder *)folder
{
    [_folderSelectButton setTitle:folder.name forState:UIControlStateNormal];
    _selectedFolder = folder;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
