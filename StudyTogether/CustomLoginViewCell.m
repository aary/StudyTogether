//
//  CustomLoginViewCell.m
//  StudyTogether
//
//  Created by Aaryaman Sagar on 1/18/15.
//  Copyright (c) 2015 Aaryaman Sagar. All rights reserved.
//

#import "CustomLoginViewCell.h"

@implementation CustomLoginViewCell

@synthesize className = _className;
@synthesize circleView = _circleView;

-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self layoutSubviews];
    
    return self;
}

-(void) layoutSubviews {
// EFFECTS : Lays out a circle and positions it correctly in the cell, lays out the foundational
//           appearance of the custom cell. All customization happens programatically and is hard
//           coded here
    [super layoutSubviews];
    
    // Create the circle and add it to the cell
    UIColor* colorForCircleView = [UIColor grayColor];
    self.circleView = [[UIButton alloc] initWithFrame:CGRectMake(5,5,80,80)];
    self.circleView.alpha = 0.5;
    self.circleView.layer.cornerRadius = 40;
    self.circleView.backgroundColor = [colorForCircleView colorWithAlphaComponent:0.5];
    [self.circleView setTitle:@"" forState:UIControlStateNormal];
    self.circleView.enabled = NO;
    self.circleView.adjustsImageWhenHighlighted = NO;
    [self.contentView addSubview:self.circleView];
    
    // Create the label and add it to the cell
    self.className = [[UILabel alloc] initWithFrame:CGRectMake(100, 15, 200, 20)];
    [self.className setText:@""];
    [self.contentView addSubview:self.className];
    
    self.collegeName = [[UILabel alloc] initWithFrame:CGRectMake(100, 45, 200, 20)];
    [self.collegeName setText:@""];
    [self.contentView addSubview:self.collegeName];
    
    /*[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[circleView]-[txtLbl]"
                                                                                     options:0
                                                                                     metrics:nil
                                                                                       views:NSDictionaryOfVariableBindings(circleView, txtLbl)]];*/
    //[self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:circleView attribute:NSLayoutAttributeLeftMargin relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeftMargin multiplier:1.0 constant:0]];

}

@end
