//
//  ListaViewController.h
//  SpaceApps
//
//  Created by Carlos Castellanos on 13/04/14.
//  Copyright (c) 2014 Carlos Castellanos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListaViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tabla;

@end
