//
//  CustomLoginViewCell.h
//  StudyTogether
//
//  Created by Aaryaman Sagar on 1/18/15.
//  Copyright (c) 2015 Aaryaman Sagar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomLoginViewCell : UITableViewCell

// The circle view and the title for the view
@property(nonatomic, retain) UIButton* circleView;

// The title and subtitle label
@property(nonatomic, retain) UILabel* className;
@property(strong, nonatomic) UILabel* collegeName;

@end
