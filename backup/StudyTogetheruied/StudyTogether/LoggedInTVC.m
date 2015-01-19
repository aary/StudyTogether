//
//  LoggedInTVC.m
//  StudyTogether
//
//  Created by Aaryaman Sagar on 1/18/15.
//  Copyright (c) 2015 Aaryaman Sagar. All rights reserved.
//

#import "LoggedInTVC.h"
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import "CustomLoginViewCell.h"

typedef CustomLoginViewCell CustomTVCell;
//#define CHECK_DATA_SOURCE_VALIDITY


@interface LoggedInTVC()
// EFFECTS : Sets the title of the navigation bar to this and formats the title
-(void) setTitleForNavigationBar:(NSString *)titleString;
@end


@implementation LoggedInTVC

-(void) viewDidLoad {
// EFFECTS : Called when the view is first loaded into memory
    [super viewDidLoad];
    
    // So that no empty rows are displayed
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    // To disallow selection
    //self.tableView.allowsSelection = NO;
    
    // Set title for navigation bar
    [self setTitleForNavigationBar:@"Your Classes"];
}

-(void) viewWillAppear:(BOOL)animated {
// EFFECTS : Called when the view is about to appear onto the screen. Any calls from
//           the model to load data from the cloud should be done here
    [super viewWillAppear:animated];
}


-(IBAction)signOutButton:(id)sender {
// EFFECTS : Signs out the user and dismisses this modally presented view to go back to the home screen
    [PFUser logOut];
    [self dismissViewControllerAnimated:YES completion:NULL];
}


-(void) setTitleForNavigationBar:(NSString *)titleString {
    UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    titleLabel.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = titleString;
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
}


//**************************************************************************************************
#pragma mark - Table view data source
//**********************************TABLE VIEW DATA SOURCE METHODS**********************************
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
// EFFECTS : Returns the number of classes that the user is taking and thus returns the
//           number of rows in this one section.
    
#ifdef CHECK_DATA_SOURCE_VALIDITY
    printf("WORKING DATA SOURCE\n\n");
#endif
    
    NSInteger numberOfRows = 6;
    // Add code here to take data from model and display the number of rows
    return numberOfRows;
}


#define MINIMUM_CELL_HEIGHT 90
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
// EFFECTS : Returns the height for a table row at the given indexPath (index and path). Uses the
//           already established model from viewWillAppear and sets the height of one row of the
//           table.
    
    CGFloat heightForRow = MINIMUM_CELL_HEIGHT;
    // Add code here to calculate the height for the given row based on input from the cloud
    // which was parsed in viewWillAppear
    return heightForRow;
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
// EFFECTS : This function is used to create or bring back from memory a table view cell. In this case
//           this function needs to be modified to return the custom cell for displaying one class
    static NSString* tableViewCellIdentifier = @"tableViewCell";
    
    CustomLoginViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
    if (cell == nil) {
        cell = [[CustomLoginViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:tableViewCellIdentifier];
    }
    
    // Modify cell according to database here

    
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
// EFFECTS : Performs a segue to the class's content based on which row, i.e. which class was
//           selected
    [self performSegueWithIdentifier:@"segueToClassContent" sender:self];
}

/*****************FOR CUSTOMIZATION*****************
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/ 
//**********************************TABLE VIEW DATA SOURCE METHODS**********************************
//**************************************************************************************************


/*
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
