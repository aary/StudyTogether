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

// The array that stores the user's current class IDs
@property (strong, nonatomic) NSArray* currentClassIDs;

// EFFECTS : Loads data from the cloud for the classes the user is currently taking.
//           stores all class IDs into currentClassIDs;
-(void) loadClassIDsFromCloud;

@property (strong, nonatomic) NSMutableArray* classNames;
@property (strong, nonatomic) NSMutableArray* classColleges;

// EFFECTS : Uses the array of currentClassIDs to get data for each class from the cloud
//           and stores it into data recognizable by the table view
-(void) parseClassDataIntoDataForTableView:(NSInteger)i;
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
    
    // Load data from the cloud for all the classes the user is taking.
    self.currentClassIDs = [[NSArray alloc] init];
    self.classNames = [[NSMutableArray alloc] init];
    self.classColleges = [[NSMutableArray alloc] init];
}

-(void) viewWillAppear:(BOOL)animated {
// EFFECTS : Called when the view is about to appear onto the screen. Any calls from
//           the model to load data from the cloud should be done here
    [super viewWillAppear:animated];
    [self loadClassIDsFromCloud];
    [self parseClassDataIntoDataForTableView:0];
    //[self.tableView reloadData];
    for (int i = 0; i < self.classNames.count; i++) {
        NSLog(@"%@", self.classNames[i]);
    }
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
    self.navigationItem.titleView = titleLabel;
    [titleLabel sizeToFit];
}

-(void) loadClassIDsFromCloud {
// EFFECTS : Loads data from the cloud for the classes the user is currently taking.
//           stores all class IDs into currentClassIDs;
    PFUser* currentUser = [PFUser currentUser];
    self.currentClassIDs = [currentUser objectForKey:@"classesTaking"];
    NSLog(@"Number of objects in classesTaking is %ld", self.currentClassIDs.count);
    if ([self.currentClassIDs count])
        NSLog(@"And its value is %@", self.currentClassIDs[0]);
}

-(void) parseClassDataIntoDataForTableView:(NSInteger) i {
    NSLog(@"i is %d", i);
    if (i == 0) {
        [self.classNames removeAllObjects];
        [self.classColleges removeAllObjects];
    }
    if (i == (self.currentClassIDs.count)) {
        [self.tableView reloadData];
        return;
    }
    
    PFQuery* query = [PFQuery queryWithClassName:@"UserClass"];
    [query getObjectInBackgroundWithId:self.currentClassIDs[i] block:^(PFObject* object, NSError* error) {
        [self.classNames insertObject:object[@"userClassName"] atIndex:i];
        [self.classColleges insertObject:object[@"collegeOfUserClass"] atIndex:i];
        [self parseClassDataIntoDataForTableView:(i+1)];
    }];
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
    
    NSInteger numberOfRows = [self.classNames count];
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
    /*else {
        for (int i = cell.contentView.subviews.count -1; i>=0; i--) {
            UIView * v = [cell.contentView.subviews objectAtIndex:i];
            if ([v isKindOfClass:[UILabel class]]) {
                [v removeFromSuperview];
            }
        }
    }*/
    
    for(UIView *view in cell.contentView.subviews){
        if ([view isKindOfClass:[UIView class]]) {
            [view removeFromSuperview];
        }
    }
    
    [cell layoutSubviews];
    
    NSString* classNameForCell = self.classNames[indexPath.row];
    NSMutableAttributedString* classNameForCellAttributed = [[NSMutableAttributedString alloc] initWithString:classNameForCell];
    [classNameForCellAttributed addAttribute:NSFontAttributeName
                                       value:[UIFont fontWithName:@"Baskerville-Bold" size:17]
                                       range:NSMakeRange(0, classNameForCell.length)];
    [cell.className setAttributedText:classNameForCellAttributed];
    //[cell.className setText:self.classNames[indexPath.row]];
    NSString* titleForCircleViewString = [self.classNames[indexPath.row] substringWithRange:NSMakeRange(0, 1)];
    
    NSMutableAttributedString* titleForCircleView = [[NSMutableAttributedString alloc] initWithString:titleForCircleViewString];
    [titleForCircleView addAttribute:NSFontAttributeName
                               value:[UIFont boldSystemFontOfSize:30]
                               range:NSMakeRange(0, titleForCircleViewString.length)];
    [titleForCircleView addAttribute:NSForegroundColorAttributeName
                               value:[UIColor whiteColor]
                               range:NSMakeRange(0, titleForCircleViewString.length)];
    [cell.circleView setAttributedTitle:titleForCircleView forState:UIControlStateNormal];
    //[cell.circleView setTitle:[self.classNames[indexPath.row] substringWithRange:NSMakeRange(0, 1)]
    //                 forState:UIControlStateNormal];
    
    NSLog(@"ClassColleges Length %@", self.classColleges[0]);
    NSString* collegeNameForCellString = self.classColleges[indexPath.row];
    NSMutableAttributedString*  collegeNameForCellAttributedString = [[NSMutableAttributedString alloc]
                                                                      initWithString:collegeNameForCellString];
    [collegeNameForCellAttributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Avenir-BookOblique"
                                                                                               size:14]
                                               range:NSMakeRange(0,collegeNameForCellString.length)];
    [collegeNameForCellAttributedString addAttribute:NSForegroundColorAttributeName value:[[UIColor grayColor] colorWithAlphaComponent:0.7]
                                               range:NSMakeRange(0, collegeNameForCellString.length)];
    [cell.collegeName setAttributedText:collegeNameForCellAttributedString];

    // Modify cell according to database here Avenir-BookOblique
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
