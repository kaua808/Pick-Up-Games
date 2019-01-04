//
//  LoginViewController.m
//  PickUpGames
//
//  Created by Kaleo Kim on 6/25/15.
//  Copyright (c) 2015 Kaleo Kim. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userEmailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userEmailTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.loginButton.backgroundColor = [UIColor whiteColor];
    
}

- (IBAction)loginButtonTapped:(id)sender {
    
    
    NSString *email = self.userEmailTextField.text;
    NSString *pass = self.passwordTextField.text;
    
    
    [PFUser logInWithUsernameInBackground:email password: pass
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            
                                            [self dismissViewControllerAnimated:YES completion:nil];
                                            
                                        } else {
                                            NSLog(@"%@", error);
                                        }
                                    }];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
    
}

@end
