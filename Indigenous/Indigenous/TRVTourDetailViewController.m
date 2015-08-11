//
//  TRVTourDetailViewController.m
//  Indigenous
//
//  Created by Leo Kwan on 8/10/15.
//  Copyright (c) 2015 Bad Boys 3. All rights reserved.
//

#import "TRVTourDetailViewController.h"
#import "TRVAllStopsView.h"
#import "TRVTourView.h"
#import <Masonry.h>

@interface TRVTourDetailViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *VCScrollView;
@property (weak, nonatomic) IBOutlet UIView *VCContentView;

@end
//
@implementation TRVTourDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TRVTourView *selectedTourView = [[TRVTourView alloc] init];
    selectedTourView.tourForThisTourView = self.destinationTour;
    [self.VCContentView addSubview:selectedTourView];
    [self.VCContentView removeConstraints:self.VCContentView.constraints];
    [selectedTourView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.equalTo(self.VCContentView);
    }];
    
    TRVAllStopsView *allStopsScrollNib = [[TRVAllStopsView alloc] init];
    [self.VCContentView addSubview:allStopsScrollNib];
  [allStopsScrollNib mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.equalTo(selectedTourView.mas_bottom);
      make.height.equalTo(@400);
      make.left.and.right.equalTo(self.VCContentView);
  }];
    
    [self.VCContentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(self.VCScrollView.mas_width);
        make.bottom.equalTo(allStopsScrollNib.mas_bottom);
    }];
    
    
    
   // Button Constraints
//    [self.testButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.VCContentView.mas_bottom);
//    }];

}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end