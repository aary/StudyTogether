//
//  CustomCell.m
//  StudyTogether
//
//  Created by Aaryaman Sagar on 1/18/15.
//  Copyright (c) 2015 Aaryaman Sagar. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

-(void) layoutSubviews {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, self.frame.size.width / 2, self.frame.size.height);
    [button addTarget:self.userLoggedInTableViewController action:@selector(touchClassName:) forControlEvents:UIControlEventTouchUpInside];
    //[button setBackgroundImage:[UIImage imageNamed:@"roundedRectButton"] forState:UIControlStateNormal];
    [button setTitle:@"Button" forState:UIControlStateNormal];
    
    UIButton* button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(self.frame.size.width / 2, 0, self.frame.size.width / 2, self.frame.size.height);
    [button2 addTarget:self.userLoggedInTableViewController action:@selector(touchClassName:) forControlEvents:UIControlEventTouchUpInside];
    //[button2 setBackgroundImage:[UIImage imageNamed:@"roundedRectButton"] forState:UIControlStateNormal];
    [button2 setTitle:@"Button" forState:UIControlStateNormal];
    
    [self addSubview:button];
    [self addSubview:button2];
    //[self.contentView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundimage"]]];
    
    
}


@end
