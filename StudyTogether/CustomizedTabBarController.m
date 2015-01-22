//
//  CustomizedTabBarController.m
//  StudyTogether
//
//  Created by Aaryaman Sagar on 1/19/15.
//  Copyright (c) 2015 Aaryaman Sagar. All rights reserved.
//

#import "CustomizedTabBarController.h"

@interface CustomizedTabBarController ()
// EFFECTS : Sets the title of the navigation bar to this and formats the title
-(void) setTitleForNavigationBar:(NSString *)titleString;
@end

@implementation CustomizedTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from the storyboard
    UIBarButtonItem *newBackButton =
    [[UIBarButtonItem alloc] initWithTitle:@"t"
                                     style:UIBarButtonItemStyleDone
                                    target:self
                                    action:nil];
    self.navigationItem.backBarButtonItem = newBackButton;
    [self setTitleForNavigationBar:@"TEST CLASS"];
}

-(void) viewWillAppear:(BOOL)animated {
    // Setup the visuals of the tabBarItems in the tab bar controller
    [[self.tabBar.items objectAtIndex:0] setTitle:@"Conversations"];
    [[self.tabBar.items objectAtIndex:1] setTitle:@"Study Groups"];

    //[[self.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"testCircle"]];
    /*NSMutableArray* array = [[NSMutableArray alloc] init];
    [array addObject:[[UITabBarItem alloc] initWithTitle:@"Conversations"
                                                  image:[UIImage imageNamed:@"testCircle"]
                                          selectedImage:[UIImage imageNamed:@"testCircle"]]];
    [array addObject:[[UITabBarItem alloc] initWithTitle:@"Study Groups"
                                                  image:[UIImage imageNamed:@"testCircle"]
                                          selectedImage:[UIImage imageNamed:@"testCircle"]]];
    self.tabBar.items = [NSArray arrayWithArray:array];*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


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


@end
