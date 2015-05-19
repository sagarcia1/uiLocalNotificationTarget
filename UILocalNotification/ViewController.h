//
//  ViewController.h
//  UILocalNotification
//
//  Created by Marcelo Garcia on 5/17/15.
//  Copyright (c) 2015 Marcelo Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UITextField *txtEvento;
@property (strong, nonatomic) IBOutlet UIButton *btAgenda;
- (IBAction)didToucheAgenda:(UIButton *)sender;
- (IBAction)didTouchPickerDate:(id)sender;


@end

