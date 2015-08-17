//
//  TRVTourImagePickerController.m
//  Indigenous
//
//  Created by Amitai Blickstein on 8/17/15.
//  Copyright (c) 2015 Bad Boys 3. All rights reserved.
//

#define DBLG NSLog(@"%@ reporting!", NSStringFromSelector(_cmd));

#import "TRVTourImagePicker.h"

@interface TRVTourImagePicker ()

@property (strong, nonatomic) IBOutlet UIImageView *tourImageSelection;
@property (weak, nonatomic) IBOutlet UIButton *selectExistingPhotoButton;
@property (weak, nonatomic) IBOutlet UIButton *takeNewPhotoButton;
- (IBAction)selectExistingPhotoButtonTapped:(id)sender;
- (IBAction)takeNewPhotoButtonTapped:(id)sender;

@end

@implementation TRVTourImagePicker

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)takeNewPhotoButtonTapped:(UIButton*)sender {
    UIImagePickerController *imagePicker = [UIImagePickerController new];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:imagePicker animated:YES completion:^{
        DBLG
    }];
}

- (IBAction)selectExistingPhotoButtonTapped:(id)sender {
    UIImagePickerController *imagePicker = [UIImagePickerController new];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:imagePicker animated:YES completion:^{
        DBLG
    }];
}


#pragma mark - UIImagePickerControlDegelate methods

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.tourImageSelection.image = chosenImage;
    
    [self dismissViewControllerAnimated:YES completion:nil];
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