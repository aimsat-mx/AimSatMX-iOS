//
//  PassesTableViewCell.h
//  SpaceApps
//
//  Created by Carlos Castellanos on 13/04/14.
//  Copyright (c) 2014 Carlos Castellanos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PassesTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *fecha;
@property (weak, nonatomic) IBOutlet UILabel *hora;
@property (weak, nonatomic) IBOutlet UILabel *elevacion;

@end
