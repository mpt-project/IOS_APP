//
//  Upload.h
//  OFICJALNA
//
//  Created by Robert Pudlowski on 06.12.2017.
//  Copyright © 2017 Robert Pudlowski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Upload : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    
    IBOutlet UIImageView *ImageView;
    UIImagePickerController *picker;
    UIImagePickerController *picker2;
    UIImage *image;
}
- (IBAction)TakePhoto:(id)sender;

- (IBAction)ChooseExisting:(id)sender;



- (IBAction)Wyjscie:(id)sender;

- (IBAction)Exit:(id)sender;


@end
