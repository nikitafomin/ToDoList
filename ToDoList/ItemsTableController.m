//
//  ItemsTableController.m
//  ToDoList
//
//  Created by Nikita Fomin on 08.02.14.
//  Copyright (c) 2014 Nikita Fomin. All rights reserved.
//

#import "ItemsTableController.h"

@interface ItemsTableController ()
{
    NSArray *_folders;
    
    UIAlertView *_newFolderAlert;
}

@end

@implementation ItemsTableController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _folders = [Folder MR_findAllSortedBy:@"order" ascending:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_folders count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Folder *folder = [_folders objectAtIndex:section];
    return [folder.items count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    Folder *folder = [_folders objectAtIndex:section];
    return [folder name];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ItemCell";
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Folder *folder = [_folders objectAtIndex:indexPath.section];
    Item *item = [[[folder items] allObjects] objectAtIndex:indexPath.row];
    [cell configureWithItem:item];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ToTaskCreate"]) {
        TaskCreateOrEditViewController *controller = [segue destinationViewController];
        [controller setDelegate:self];
    } else if ([segue.identifier isEqualToString:@"ToTaskEdit"]) {
        TaskCreateOrEditViewController *controller = [segue destinationViewController];
        [controller setDelegate:self];
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        Folder *folder = [_folders objectAtIndex:indexPath.section];
        Item *item = [[[folder items] allObjects] objectAtIndex:indexPath.row];
        [controller setItem:item];
    }
}

#pragma mark - Actions

- (void)addFolderClick
{
    NSLog(@"\n\nAdd folder\n\n");
    
    _newFolderAlert = [[UIAlertView alloc] initWithTitle:@"new folder" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Done", nil];
    [_newFolderAlert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [_newFolderAlert show];
}

#pragma mark - Alert view delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView == _newFolderAlert) {
        if (buttonIndex == 1) {
            Folder *newFolder = [Folder MR_createEntity];
            [newFolder setName:[[alertView textFieldAtIndex:0] text]];
            [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
            _folders = [Folder MR_findAllSortedBy:@"order" ascending:YES];
            [self.tableView reloadData];
        }
        _newFolderAlert = nil;
    }
}

#pragma mark - Task create or edit conrtoller delegate

- (void)taskCreateOrEditViewControllerDidCancel:(TaskCreateOrEditViewController *)controller
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)taskCreateOrEditViewController:(TaskCreateOrEditViewController *)controller didCreateItem:(Item *)item
{
    _folders = [Folder MR_findAllSortedBy:@"order" ascending:YES];
    [self.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)taskCreateOrEditViewController:(TaskCreateOrEditViewController *)controller didChangeItem:(Item *)item
{
    _folders = [Folder MR_findAllSortedBy:@"order" ascending:YES];
    [self.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
