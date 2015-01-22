//
//  LoggedInTVC.h
//  StudyTogether
//
//  Created by Aaryaman Sagar on 1/18/15.
//  Copyright (c) 2015 Aaryaman Sagar. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>



@interface LoginViewController ()
@end


static NSString* segueToLoggedInScreen = @"segueToLoggedInScreen";


@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [PFUser logOut];
    
    /*Create sample user
    PFUser *user = [PFUser user];
    user.username = @"aary";
    user.password = @"1234";
    user.email = @"email@example.com";
    
    // other fields can be set just like with PFObject
    user[@"phone"] = @"734-741-XXXX";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
        }
    }];*/
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundimage"]]];

}



- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
    if ([PFUser currentUser]){
        NSLog(@"User present");
        [self dismissViewControllerAnimated:YES completion:NULL];
        [self performSegueWithIdentifier:segueToLoggedInScreen sender:self];
    }
    
    else{
        NSLog(@"User absent");
    }

    if (![PFUser currentUser]) { // No user logged in
        
        // Create the log in view controller
        PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
        [logInViewController setDelegate:self]; // Set ourselves as the delegate

        // EXAMPLE USER
        logInViewController.logInView.usernameField.text = @"aary";
        logInViewController.logInView.passwordField.text = @"1234";
        
        // DRAWING A CIRCLE
        /*UIButton* circleView = [[UIButton alloc] initWithFrame:CGRectMake(100,100,50,50)];
        circleView.alpha = 0.5;
        circleView.layer.cornerRadius = 25;
        circleView.backgroundColor = [UIColor grayColor];
        [circleView setTitle:@"S" forState:UIControlStateNormal];
        circleView.enabled = NO;
        [logInViewController.logInView addSubview:circleView];
        */
        
        // CUSTOMIZE LOGIN VIEW CONTROLLER HERE***********************************************************************************
        [logInViewController.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundimage"]]];
        [logInViewController.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]]];
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(125, 150, 150, 150)];
        NSDictionary* myDict = [NSDictionary dictionaryWithObjectsAndKeys:[[UIColor cyanColor] colorWithAlphaComponent:0.65],
                                NSForegroundColorAttributeName, [UIFont fontWithName:@"American Typewriter" size:40],
                                NSFontAttributeName, nil];
        
        [label setAttributedText:[[NSAttributedString alloc] initWithString:@"LOGIN"
                                                                 attributes:myDict]];
        [logInViewController.view addSubview:label];

        // Add constraints to label wrt username field
        UIView* userField = logInViewController.logInView.usernameField;
        [logInViewController.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-[userField]"
                                                                                         options:0
                                                                                         metrics:nil
                                                                                           views:NSDictionaryOfVariableBindings(label, userField)]];
        [logInViewController.view addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:logInViewController.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];

        label.translatesAutoresizingMaskIntoConstraints = NO;
        
        // Change passwordforgot button
        [logInViewController.logInView.passwordForgottenButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //[logInViewController.logInView.passwordForgottenButton setBackgroundImage:[UIImage imageNamed:@"roundedRectButton"]
        //                                                                 forState:UIControlStateNormal];
        /*UIView* pfb = logInViewController.logInView.passwordForgottenButton;
        UIView* logInButton = logInViewController.logInView.logInButton;
        CGRect newFrame = CGRectMake(0, 0, 70, 20);
        [pfb setFrame:newFrame];
        [logInViewController.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[pfb]-[logInButton]"
                                                                                         options:0
                                                                                         metrics:nil
                                                                                           views:NSDictionaryOfVariableBindings(pfb, logInButton)]];
        [logInViewController.view addConstraint:[NSLayoutConstraint constraintWithItem:pfb attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:logInViewController.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
        pfb.translatesAutoresizingMaskIntoConstraints = NO;*/
        // CUSTOMIZE LOGIN VIEW CONTROLLER HERE***********************************************************************************

        
        
        // Create the sign up view controller
        PFSignUpViewController *signUpViewController = [[PFSignUpViewController alloc] init];
        [signUpViewController setDelegate:self]; // Set ourselves as the delegate
        
        
        // CUSTOMIZE SIGNUP VIEW CONTROLLER HERE***********************************************************************************
        [signUpViewController.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundimage"]]];
        [signUpViewController.signUpView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]]];
        UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(115, 150, 180, 180)];
        [label2 setAttributedText:[[NSAttributedString alloc] initWithString:@"SIGN UP"
                                                                 attributes:myDict]];
        [signUpViewController.signUpView addSubview:label2];
        
        // Add Constraints. To add visual constraints in vertical direction to some other number do @"V:[label2]-X-[button2]"
        UIView* userField2 = signUpViewController.signUpView.usernameField;
        [signUpViewController.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label2]-[userField2]"
                                                                                         options:0
                                                                                         metrics:nil
                                                                                           views:NSDictionaryOfVariableBindings(label2, userField2)]];
        [signUpViewController.view addConstraint:[NSLayoutConstraint constraintWithItem:label2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:signUpViewController.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
        label2.translatesAutoresizingMaskIntoConstraints = NO;
        // CUSTOMIZE SIGNUP VIEW CONTROLLER HERE***********************************************************************************


        
        // Assign our sign up controller to be displayed from the login controller
        [logInViewController setSignUpController:signUpViewController];
        
        // Present the log in view controller
        [self presentViewController:logInViewController animated:YES completion:NULL];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


#pragma mark - PFLogInViewControllerDelegate

// Sent to the delegate to determine whether the log in request should be submitted to the server.
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    // Check if both fields are completed
    if (username && password && username.length && password.length) {
        return YES; // Begin login process
        
    }
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Make sure you fill out all of the information!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    return NO; // Interrupt login process
    
}



// Sent to the delegate when a PFUser is logged in.
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    NSLog(@"Successful Log In\n");

    // Segue now into new thing
    [self dismissViewControllerAnimated:YES completion:NULL];
    [self performSegueWithIdentifier:segueToLoggedInScreen sender:self];
    //    CurrentReservationsTableViewController *reservations = [[CurrentReservationsTableViewController alloc] init];
    //    [self presentViewController:reservations animated:YES completion:NULL];
}

// Sent to the delegate when the log in attempt fails.
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
    
}

// Sent to the delegate when the log in screen is dismissed.
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    NSLog(@"User dismissed the logInViewController");
    
}

#pragma mark - PFSignUpViewControllerDelegate

// Sent to the delegate to determine whether the sign up request should be submitted to the server.

- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {
    
    BOOL informationComplete = YES;
    
    // loop through all of the submitted data
    for (id key in info) {
        NSString *field = [info objectForKey:key];
        if (!field || !field.length) { // check completion
            informationComplete = NO;
            break;
        }
    }
    
    
    
    // Display an alert if a field wasn't completed
    
    if (!informationComplete) {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Make sure you fill out all of the information!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
        
    }
    return informationComplete;
}



// Sent to the delegate when a PFUser is signed up.

- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
}



// Sent to the delegate when the sign up attempt fails.

- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
    NSLog(@"Failed to sign up...");
}



// Sent to the delegate when the sign up screen is dismissed.

- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
    
    NSLog(@"User dismissed the signUpViewController");
    
}

#pragma mark - ()

- (IBAction)logOutButtonTapAction:(id)sender {
    [PFUser logOut];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController]
    // Pass the selected object to the new view controller.
    
}





@end