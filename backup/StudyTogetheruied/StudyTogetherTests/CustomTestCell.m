//
//  CustomCell.m
//  test
//
//  Created by Aaryaman Sagar on 1/19/15.
//  Copyright (c) 2015 Aaryaman Sagar. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize customButton, customLabel;

- (void)awakeFromNib {
    // Initialization code
}

+(CustomCell *) cellWithButtonTitle:(NSString *)title andLabelString:(NSString *)labelTitle {
    CustomCell* cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    [cell.customButton setTitle:title forState:UIControlStateNormal];
    cell.customLabel.text = labelTitle;
    return cell;
}

-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        customLabel = [[UILabel alloc] initWithFrame:CGRectMake(3, 5, 160, 30)];
        customLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        customLabel.textColor = [UIColor blueColor];
        customLabel.backgroundColor = [UIColor clearColor];
        customLabel.highlightedTextColor = [UIColor whiteColor];
        customLabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:customLabel];
        
        customButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        customButton.frame = CGRectMake(100, 5, 40, 30);
        [customButton addTarget:self action:@selector(logButtonRow:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:customButton];
    }
    
    return self;
}

-(void) logButtonRow:(UIButton *) sender {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end