//
//  HullToRefresh.m
//  HullToRefresh
//
//  Created by 右京 和馬 on 2012/08/31.
//  Copyright (c) 2012年 yaakaito.org. All rights reserved.
//

#import "HullToRefresh.h"
#import <CoreMotion/CoreMotion.h>

@interface HullToRefresh()
@property (nonatomic) double beforeX;
@property (nonatomic, strong) CMMotionManager *manager;
@end

@implementation HullToRefresh
+ (id)sharedHullHull {
    
    static dispatch_once_t pred = 0;
    __strong static HullToRefresh *_sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
        [_sharedObject hullhull];
    });
    return _sharedObject;
}

- (void)hullhull {
    
    self.beforeX = 0.0;
    self.manager = [[CMMotionManager alloc] init];
    self.manager.accelerometerUpdateInterval = 0.1f;
    
    [self.manager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                       withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
                                           CMAcceleration acceleration = accelerometerData.acceleration;
                                           if(fabs(self.beforeX - acceleration.x) > 1.0) {
                                               [[NSNotificationCenter defaultCenter] postNotificationName:kDidHullHullNotification object:self];
                                           }
                                           self.beforeX = acceleration.x;
                                       }];
}
@end
