//
//  SettingsViewController.m
//  Tip Calculator
//
//  Created by Mason Llewellyn on 6/23/20.
//  Copyright © 2020 Facebook University. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *settingsControl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Settings";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    long tipIDX = [defaults integerForKey:@"default_tip_index"];
    
    self.settingsControl.selectedSegmentIndex = tipIDX;
}
- (IBAction)saveButtonTouched:(id)sender {
    NSLog(@"Saving Defaults");
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.settingsControl.selectedSegmentIndex forKey:@"default_tip_index"];
    [defaults synchronize];
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
