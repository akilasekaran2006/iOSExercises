//
//  LoginViewController.m
//  Akila_WellsFargoExercise
//
//  Created by Akila Sivapathasekaran on 8/13/16.
//  Copyright © 2016 Akila Sivapathasekaran. All rights reserved.
//

#import "LoginViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
#define kBlueColor [UIColor colorWithRed:82.0/255.0 green:115.0/255.0 blue:185.0/255.0 alpha:1.0];

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIImageView *vogueImage;

@property (weak, nonatomic) IBOutlet UIView *touchBGView;
@property (weak, nonatomic) IBOutlet UIImageView *touchBGImage;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self customizeView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)customizeView{
    
    self.loginButton.backgroundColor = kBlueColor;
    self.touchBGView.hidden = YES;
    [self.view bringSubviewToFront:self.loginButton];
    self.touchBGView.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.7];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
//}

//- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
//    //loginToStoreView
//}

#pragma mark - Login tapped
/* When user clicks on login, alpha is applied on the top of the log in view and touch enables user authentication.
 */
- (IBAction)loginTapped:(id)sender {
    
    self.loginButton.hidden = YES;
    self.touchBGView.hidden = NO;
    [self performSelector:@selector(authenticateUser:) withObject:sender afterDelay:1.0];
}

/* User is authenticated using LAContext. User is allowed to login even if he fails the authentication, but is prompted with alert view 
 the error message associated with the failure */
- (void) authenticateUser:(id)sender {
    
    LAContext *context = [[LAContext alloc] init];
    context.localizedFallbackTitle = @"";
    
    NSError *error = nil;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                localizedReason:@"Are you the device owner?"
                          reply:^(BOOL success, NSError *error) {
                              
                              if (error) {
                                  
                                  dispatch_async(dispatch_get_main_queue(), ^{
                                      UIAlertController *alertController = [UIAlertController
                                                                            alertControllerWithTitle:@"Logging in!"
                                                                            message:@"But there was a problem verifying your identity."
                                                                            preferredStyle:UIAlertControllerStyleAlert];
                                      
                                      UIAlertAction *okAction = [UIAlertAction
                                                                 actionWithTitle:NSLocalizedString(@"OK", @"OK")
                                                                 style:UIAlertActionStyleDefault
                                                                 handler:^(UIAlertAction *action)
                                                                 {
                                                                    [self performSegueWithIdentifier:@"loginToStoreView" sender:sender];
                                                                 }];
                                      
                                      [alertController addAction:okAction];
                                      [self presentViewController:alertController animated:YES completion:^{
                                          
                                      }];
                                      return;
                                  });
                              }
                              
                              if (success) {
                                  [self performSegueWithIdentifier:@"loginToStoreView" sender:sender];
                        
                                  
                              } else {
                                  
                                  dispatch_async(dispatch_get_main_queue(), ^{
                                      UIAlertController *alertController = [UIAlertController
                                                                            alertControllerWithTitle:@"Logging in!"
                                                                            message:@"But looks like you are not the user."
                                                                            preferredStyle:UIAlertControllerStyleAlert];
                                      
                                      UIAlertAction *okAction = [UIAlertAction
                                                                 actionWithTitle:NSLocalizedString(@"OK", @"OK")
                                                                 style:UIAlertActionStyleDefault
                                                                 handler:^(UIAlertAction *action)
                                                                 {
                                                                     [self performSegueWithIdentifier:@"loginToStoreView" sender:sender];
                                                                 }];
                                      
                                      [alertController addAction:okAction];
                                      [self presentViewController:alertController animated:YES completion:^{
                                          
                                      }];

                                  });
                                  
                              }
                              
                          }];
        
    } else {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:@"Logging in!"
                                                  message:@"But Looks like you are not the user."
                                                  preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"OK", @"OK")
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action)
                                       {
                                           [self performSegueWithIdentifier:@"loginToStoreView" sender:sender];
                                       }];
            
            [alertController addAction:okAction];
            [self presentViewController:alertController animated:YES completion:^{
                
            }];
        });
    }
}

/* alpha is removed from superview when the view disappears */
- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.touchBGView.hidden = YES;
}


@end
