//
//  CustomCell.h
//  test
//
//  Created by Aaryaman Sagar on 1/19/15.
//  Copyright (c) 2015 Aaryaman Sagar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell {
    UILabel* customLabel;
    UIButton* customButton;
}

+(CustomCell *) cellWithButtonTitle:(NSString *)title andLabelString:(NSString *)labelTitle;

@property (nonatomic, retain) UILabel* customLabel;
@property(nonatomic, retain) UIButton* customButton;

@end
