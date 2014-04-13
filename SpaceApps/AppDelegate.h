//
//  AppDelegate.h
//  SpaceApps
//
//  Created by Carlos Castellanos on 12/04/14.
//  Copyright (c) 2014 Carlos Castellanos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    
    CMMotionManager *motionManager;
   
    
}
 @property (strong, nonatomic) NSString *nombre;
@property (readonly) CMMotionManager *motionManager;


@property (strong, nonatomic) UIWindow *window;

@end
