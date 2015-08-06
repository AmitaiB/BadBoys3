//
//  TRVSearchTripsTableViewController.h
//  Indigenous
//
//  Created by Leo Kwan on 8/2/15.
//  Copyright (c) 2015 Bad Boys 3. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRVUser.h"

@interface TRVGuideResultsTableViewController : UITableViewController

@property (nonatomic, strong) TRVUser *user;
@property (nonatomic, strong) NSString *selectedCity;

@end
