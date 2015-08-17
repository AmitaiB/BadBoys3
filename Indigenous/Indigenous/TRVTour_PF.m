//
//  TRVTour_PF.m
//  Indigenous
//
//  Created by Amitai Blickstein on 8/16/15.
//  Copyright (c) 2015 Bad Boys 3. All rights reserved.
//

#import "TRVTour_PF.h"

@implementation TRVTour_PF
+(void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName
{
    return NSStringFromClass([TRVTour_PF class]);
}

-(instancetype)initWithDefaultValues {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.tourName = @"Your Awesome Tour!";
    self.tourGuide = [PFUser currentUser].username;
    self.tourCategory.tourCategoryType = TRVTourCategoryNull;
    self.depatureDate = [NSDate date];
    [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *point, NSError *error) {
        if (!error) {
            self.tourStopGeoPoints = [@[point] mutableCopy];
            NSLog(@"self.tourStopGeoPoints: %@", [self.tourStopGeoPoints description]);
        } else NSLog(@"%@", error.localizedDescription);
    }];
    
    return self;
}

-(instancetype)init {
    return [self initWithDefaultValues];
}

/**
 *  Broken. Don't use.
 *
 *  @return nil! Dammit!!
 */
-(NSArray *)allValues {
    NSMutableArray *temp = [NSMutableArray new];

    if (self.tourGuide) {
        [temp addObject:self.tourGuide];
    } else [temp addObject:@"."];
    
    if (self.tourName) {
        [temp addObject:self.tourName];
    } else [temp addObject:@".."];
    
    if ([self.tourCategory description]) {
        [temp addObject:[self.tourCategory description]];
    } else [temp addObject:@"..."];
    if ([self.depatureDate description]) {
        [temp addObject:[self.depatureDate description]];
    } else [temp addObject:@"...."];
    if ([@(self.tourStopGeoPoints.count) stringValue]) {
        [temp addObject:[NSString stringWithFormat:@"Itinerary with %@ locations",[@(self.tourStopGeoPoints.count) stringValue]]];
    } [temp addObject:@"....."];
    NSLog(@"%@", [temp description]);
    return [temp copy];
}


@end