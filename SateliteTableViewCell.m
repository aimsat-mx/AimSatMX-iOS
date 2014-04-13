//
//  SateliteTableViewCell.m
//  SpaceApps
//
//  Created by Carlos Castellanos on 13/04/14.
//  Copyright (c) 2014 Carlos Castellanos. All rights reserved.
//

#import "SateliteTableViewCell.h"

@implementation SateliteTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *satelite=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"satelite.jpg"]];
        CGRect frame=CGRectMake(10, 10, 63, 63);
        satelite.frame=frame;
        [self addSubview:satelite];
        _nombre=[[UILabel alloc]initWithFrame:CGRectMake(83, 20, 280, 60)];
        [_nombre setFont:[UIFont systemFontOfSize:18]];
        [self addSubview:_nombre];
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
