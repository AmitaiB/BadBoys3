//
//  TRVAddTourTableViewController.h
//  Indigenous
//
//  Created by Amitai Blickstein on 8/15/15.
//  Copyright (c) 2015 Bad Boys 3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRVAddTourTableViewController : UITableViewController <UITextFieldDelegate>

@property (strong, nonatomic) NSArray *defaultTourCellTitles;
@property (strong, nonatomic) NSArray *defaultTourCellDetailTitles;

@end