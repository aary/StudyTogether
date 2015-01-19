//
//  LoggedInViewController2.m
//  StudyTogether
//
//  Created by Aaryaman Sagar on 1/18/15.
//  Copyright (c) 2015 Aaryaman Sagar. All rights reserved.
//

#import "LoggedInViewController2.h"
#import <ParseUI/ParseUI.h>
#import <Parse/Parse.h>

@implementation LoggedInViewController2


- (IBAction)signOut:(id)sender {
    // EFFECTS : Signs out the user
    [PFUser logOut];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void) viewDidLoad {
    [super viewDidLoad];
    self.myTableView2.delegate = self;
    self.myTableView2.dataSource = self;
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
