//
//  ViewController.m
//  Tip Calculator
//
//  Created by Mason Llewellyn on 6/23/20.
//  Copyright © 2020 Facebook University. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onTap:(id)sender {
    //Function that is called whenever the tap gesture is performed
    NSLog(@"Hello");
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    //Function that is called whenever the edit status of the text field changes or the value of the Tip Control changes
    double bill = [self.billField.text doubleValue];
    
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)]; //Create an NSArray of NS numbers
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat: @"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat: @"$%.2f", total];
    
}
- (IBAction)onEditBegin:(id)sender {
    //Move Text box when editing starts
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y += 30;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = newFrame;
        
        self.tipLabel.alpha = 0;
        self.totalLabel = 0;
    }];}

- (IBAction)onEditEnd:(id)sender {
    //Move text box back once editing is complete
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y -= 30;
    
    //Wrapping code in this block animates whatever changes are made
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = newFrame;
        
        self.tipLabel.alpha = 1;
        self.totalLabel.alpha = 0;
    }];
}

@end
