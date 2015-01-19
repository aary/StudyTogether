//
//  UserLoggedInViewController.m
//  StudyTogether
//
//  Created by Aaryaman Sagar on 1/17/15.
//  Copyright (c) 2015 Aaryaman Sagar. All rights reserved.
//

#import "UserLoggedInViewController.h"
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import "CustomCell.h"

@implementation UserLoggedInViewController

- (IBAction)signOut:(id)sender {
    // EFFECTS : Signs out the user
    [PFUser logOut];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //[self.view setBackgroundColor:[UIColor grayColor]];
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundimage"]]];
    //[self.tableView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundimage"]]];
    //[self.tableView setBackgroundColor:[UIColor grayColor]];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return count of database table
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableViewCell"];
        //cell.userLoggedInTableViewController = self;
        printf("CREATED CELL\n");
    }
    
    return cell;
}

-(IBAction) touchClassName:(id)sender {
    printf("HTOUCHHEDCLASSBUTOTN\n");
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}


@end
