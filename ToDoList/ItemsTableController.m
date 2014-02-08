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
    
    UIAlertView *_newItemAlert;
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark - Actions

- (void)addFolderClick
{
    NSLog(@"\n\nAdd folder\n\n");
    
    _newFolderAlert = [[UIAlertView alloc] initWithTitle:@"new folder" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Done", nil];
    [_newFolderAlert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [_newFolderAlert show];
}

- (void)addItemClick
{
    NSLog(@"\n\nAdd item\n\n");
    
    _newItemAlert = [[UIAlertView alloc] initWithTitle:@"new task" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Done", nil];
    [_newItemAlert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [_newItemAlert show];
}

#pragma mark - Alert view delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView == _newFolderAlert) {
        if (buttonIndex == 1) {
            Folder *newFolder = [Folder MR_createEntity];
            [newFolder setName:[[alertView textFieldAtIndex:0] text]];
            [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
            [self.tableView reloadData];
        }
        _newFolderAlert = nil;
    } else if (alertView == _newItemAlert) {
        if (buttonIndex == 1) {
            Item *newFolder = [Item MR_createEntity];
            Folder *folder = [Folder MR_findFirst];
            [newFolder setFolder:folder];
            [newFolder setName:[[alertView textFieldAtIndex:0] text]];
            [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
            [self.tableView reloadData];
        }
        _newItemAlert = nil;
    }
}

@end
