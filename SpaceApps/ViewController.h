//
//  ViewController.h
//  SpaceApps
//
//  Created by Carlos Castellanos on 12/04/14.
//  Copyright (c) 2014 Carlos Castellanos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>
@interface ViewController : UIViewController <CLLocationManagerDelegate>


@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UILabel *a;
@property (weak, nonatomic) IBOutlet UILabel *b;
@property (weak, nonatomic) IBOutlet UILabel *c;
@property (weak, nonatomic) IBOutlet UILabel *d;
@property (weak, nonatomic) IBOutlet UILabel *e;
@property (weak, nonatomic) IBOutlet UILabel *f;
@property (weak, nonatomic) IBOutlet UILabel *g;
@property (weak, nonatomic) IBOutlet UIImageView *compassImage;
@property (weak, nonatomic) IBOutlet UILabel *h;
@end
