//
//  Upload.m
//  OFICJALNA
//
//  Created by Robert Pudlowski on 06.12.2017.
//  Copyright © 2017 Robert Pudlowski. All rights reserved.
//

#import "Upload.h"

@interface Upload ()

@end

@implementation Upload

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/





- (IBAction)TakePhoto:(id)sender {
    picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
   [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
   
  [self presentViewController:picker animated:YES completion:NULL];
   
    }


- (IBAction)ChooseExisting:(id)sender {
    picker2 = [[UIImagePickerController alloc] init];
    picker2.delegate = self;
    [picker2 setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    [self presentViewController:picker2 animated:YES completion:NULL];
    
}



-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [ImageView setImage:image];
    [self dismissViewControllerAnimated:YES completion:NULL];
    }

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}



- (NSString *)encodeToBase64String:(UIImage *)image {
    return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

- (IBAction)Wyjscie:(id)sender {
}

- (IBAction)Exit:(id)sender {
    [self performSegueWithIdentifier:@"ToExit" sender:self];
}

@end
