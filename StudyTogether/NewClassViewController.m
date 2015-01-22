//
//  NewClassViewController.m
//  StudyTogether
//
//  Created by Aaryaman Sagar on 1/22/15.
//  Copyright (c) 2015 Aaryaman Sagar. All rights reserved.
//

#import "NewClassViewController.h"
#import <ParseUI/ParseUI.h>
#import <Parse/Parse.h>

@interface NewClassViewController ()

// The label for the ID UITextField
@property (weak, nonatomic) IBOutlet UITextField *classIdTextLabel;

@end

@implementation NewClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneButton:(id)sender {
    NSString* textFromTextField = self.classIdTextLabel.text;
    
    PFQuery* query = [PFQuery queryWithClassName:@"UserClass"];
    [query getObjectInBackgroundWithId:textFromTextField block:^(PFObject* userClass, NSError* error) {
        if (!error) {
            PFUser* currentUser = [PFUser currentUser];
            NSLog(@"userID %@", [currentUser objectId]);
            NSArray* arrayOfClassIDs = currentUser[@"classesTaking"];
            if (![arrayOfClassIDs containsObject:textFromTextField]) {
                [currentUser addObject:textFromTextField forKey:@"classesTaking"];
                [currentUser saveInBackground];
                [self dismissViewControllerAnimated:YES completion:NULL];
            }
            else {
                UIAlertView *unsuccessfulTry = [[UIAlertView alloc]
                                                initWithTitle:@"CLASS EXISTS"
                                                message:@"Please try again or click cancel"
                                                delegate:self
                                                cancelButtonTitle:@"Ok"
                                                otherButtonTitles:nil];
                [unsuccessfulTry show];
            }
        }
        else {
            UIAlertView *unsuccessfulTry = [[UIAlertView alloc]
                                            initWithTitle:@"INVALID CLASS ID"
                                            message:@"Please try again or click cancel"
                                            delegate:self
                                            cancelButtonTitle:@"Ok"
                                            otherButtonTitles:nil];
            [unsuccessfulTry show];
        }
    }];
}

- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
