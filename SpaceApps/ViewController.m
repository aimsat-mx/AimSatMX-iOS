//
//  ViewController.m
//  SpaceApps
//
//  Created by Carlos Castellanos on 12/04/14.
//  Copyright (c) 2014 Carlos Castellanos. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>
#import <CoreMotion/CMAccelerometer.h>
#import <CoreMotion/CMDeviceMotion.h>
#import <CoreMotion/CMMotionManager.h>
#include <math.h>;

#import <AVFoundation/AVAudioPlayer.h>


#include <stdlib.h>

#define SIZE 10
#define LENGTH 65535
const int PLAYBACKFREQ = 44100;
const float PI2 = 3.14159265359f * 2;
const int freq1 = 697;
const int freq2 = 1209;


#import <AudioToolbox/AudioToolbox.h>
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController
{
    float latitude;
    float longitude;
    float altitude;
    float azimuth;
    AVAudioPlayer *audioPlayer;
    AVAudioPlayer *audioPlayerPitch;
    int anterior;
    AppDelegate *delegate;
  
    
}


- (void)viewDidLoad

{
   // self.view.backgroundColor=[UIColor colorWithRed:6 green:55 blue:87 alpha:1];
     delegate= (AppDelegate *) [[UIApplication sharedApplication] delegate];
    self.title=delegate.nombre;
    anterior=0;
    
    NSDate *currentTime = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm:ss"];
    NSString *resultString = [dateFormatter stringFromDate: currentTime];
    NSLog(@"%@",resultString);
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	_locationManager.headingFilter = 1;
	
    [_locationManager startUpdatingHeading];
    [_locationManager startUpdatingLocation];
    [super viewDidLoad];
    [self startMyMotionDetect];
    
   // AudioServicesPlaySystemSound(1005);
   // AudioServicesPlayAlertSound(1005);
    // Allocate space for an array with ten elements of type int.
    int *ptr = malloc(SIZE * sizeof(int));
    if (ptr == NULL) NSLog(@"Error: Memory buffer could not be allocated.");
    else NSLog(@"Allocation succeeded.");
    
   /* // The formula for the tone, the content of the buffer.
    for(int i=0; i<SIZE; i++) ptr[i] = (sin(i*(PI2*(PLAYBACKFREQ/freq1))) + sin(i*    (PI2*(PLAYBACKFREQ/freq2)))) * 16383;
    NSData *myData = [[NSData alloc] initWithBytesNoCopy:ptr length:SIZE];
   // free(ptr);
    ptr = NULL;
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithData:myData error:&error];
    [audioPlayer play];
    audioPlayer.numberOfLoops = -1;
    
    [self playAudio:nil];
    */
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/beep-12.mp3", [[NSBundle mainBundle] resourcePath]]];
    
    NSError *error;
    audioPlayerPitch = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    audioPlayerPitch.numberOfLoops = -1;
    NSURL *url2 = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/beep-11.mp3", [[NSBundle mainBundle] resourcePath]]];
    
    NSError *error2;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url2 error:&error2];
    audioPlayer.numberOfLoops = -1;
	// Do any additional setup after loading the view, typically from a nib.
}

- (CMMotionManager *)motionManager
{
    CMMotionManager *motionManager = nil;
    
    id appDelegate = [UIApplication sharedApplication].delegate;
    
    if ([appDelegate respondsToSelector:@selector(motionManager)]) {
        motionManager = [appDelegate motionManager];
    }
    
    return motionManager;
}



-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    
  //  CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //animation.fromValue = [NSNumber numberWithFloat:0];
    //animation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    //animation.duration = 3.0;
    //animation.repeatCount = HUGE_VALF;
    //animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //[self.discView.layer addAnimation:animation forKey:@"transform.rotation.z"];
    
    float oldRad =  -manager.heading.trueHeading * M_PI / 180.0f;
    
    float newRad =  -newHeading.trueHeading * M_PI / 180.0f;
    
    
    // Creamos una animación.
    CABasicAnimation *theAnimation;
    
    // Será de tipo rotación
    theAnimation=[CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    
    // Establecemos los valores del giro.
    theAnimation.fromValue = [NSNumber numberWithFloat:oldRad];
    
    theAnimation.toValue=[NSNumber numberWithFloat:newRad];
    
    // Podemos poner una duración, pero puede resultar retrasado si ponemos tiempo.
    theAnimation.duration = 0.0;
    
    
    
    // Le aplicamos la animación a la imagen de la brújula.
    [_compassImage.layer addAnimation:theAnimation forKey:@"animateMyRotation"];
    
    _compassImage.transform = CGAffineTransformMakeRotation(newRad);

        _a.text = [NSString stringWithFormat:@"%i", (int)newHeading.magneticHeading];
    if (newHeading.magneticHeading>=45 && newHeading.magneticHeading<=70 ) {
      
  
        
        if (audioPlayer == nil){}
        //    NSLog([error description]);
            else {
                
                if (![audioPlayer isPlaying]) {
                    NSLog(@"");
                    [audioPlayer play];
                    [audioPlayer setNumberOfLoops:-1];
                }
                
               }

    }
    else{
    [audioPlayer stop];
    }
    _b.text = [NSString stringWithFormat:@"%f", newHeading.trueHeading];
   _c.text = [NSString stringWithFormat:@"%f", self.locationManager.location.coordinate.longitude];
    _d.text = [NSString stringWithFormat:@"%f", self.locationManager.location.coordinate.latitude];
   
    azimuth  = (float) manager.heading.magneticHeading;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    latitude = (float) manager.location.coordinate.latitude;
    longitude = (float) manager.location.coordinate.longitude;
    altitude = (float) manager.location.altitude;
    _f.text= [NSString stringWithFormat:@"%f",altitude];
}

- (void)startMyMotionDetect
{
    
    
    [self.motionManager startAccelerometerUpdatesToQueue:[[NSOperationQueue alloc] init]
                                             withHandler:^(CMAccelerometerData *data, NSError *error)
     {
         dispatch_async(dispatch_get_main_queue(),
                        ^{
                            //pitch = atan (x / sqrt(y^2 + z^2))
                            //  ViewingAltitude = Math.Atan2(z, Math.Sqrt(x*x + y*y));
                            
                           // NSLog(@"y =%f",data.acceleration.y );
                           // NSLog(@"x=%f",data.acceleration.x);
                           // NSLog(@"z=%f",data.acceleration.z);
                            
                            float pitch2 = (atan2(data.acceleration.y, data.acceleration.z) * 180.0) /M_PI;
                            if (pitch2<=0) {
                                
                              
                            
                            //float pitch= atan (data.acceleration.x / raiz   );
                            pitch2=pitch2+180;
                                
                            
                            int d=(int)pitch2 ;
                                 NSLog(@"z=%i   ",d);
                            if (d!=anterior) {
                                NSLog(@"entero %i",d);
                                NSLog(@"entra");
                                
                                _g.text= [NSString stringWithFormat:@"%i",d];
                                
                                if (d>=40 && d<= 60) {
                                    
                                   
                                    
                                    if (audioPlayerPitch == nil){
                                    NSLog(@"no audio");
                                    }
                                    //    NSLog([error description]);
                                    else {
                                        if (![audioPlayerPitch isPlaying]) {
                                            NSLog(@"");
                                            [audioPlayerPitch setNumberOfLoops:-1];
                                            [audioPlayerPitch play];
                                        }
                                      //  [audioPlayerPitch play];
                                    }
                                    
                                }
                                
                                else{
                                    [audioPlayerPitch stop];
                                }
                                anterior=(int)pitch2;
                            }
                            else{
                                NSLog(@"nno entra");
                            }
                           
                           
                            //_e.text= [NSString stringWithFormat:@"%f",(pitch*180)/M_PI];
                            //_h.text= [NSString stringWithFormat:@"%f",(data.acceleration.y * 100)];
                            //NSLog (@"%f, sin pi %f , y pi es%f ",(data.acceleration.y * 180 / M_PI),data.acceleration.y , M_PI);
                            }
                        });
         
     }
     ];
  
    
    
}

- (void)viewDidDisappear:(BOOL)animated {
     [audioPlayerPitch stop];
     [audioPlayer stop];
     audioPlayer = nil;
     audioPlayerPitch = nil;
}


@end
