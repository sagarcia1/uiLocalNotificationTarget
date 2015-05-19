//
//  ViewController.m
//  UILocalNotification
//
//  Created by Marcelo Garcia on 5/17/15.
//  Copyright (c) 2015 Marcelo Garcia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //adicionado um observer do nsnotification para abrir o app quando a notification aparece
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(openAlert:)
     name:@"task"
     object:nil];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)didToucheAgenda:(UIButton *)sender {
    
    NSDate *pickerDate = [self.datePicker date];
    
    //para agendar a notificação
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = pickerDate; // data que vai ser disparada a notificação
    localNotification.alertBody = self.txtEvento.text;
    localNotification.alertAction = @"Ver a ação";
    localNotification.timeZone = [NSTimeZone localTimeZone];
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];// agenda e notificação.
    
    self.txtEvento.text = @"";
    UIAlertView *alert  = [[UIAlertView alloc]initWithTitle:@"Salvo" message:[NSString stringWithFormat:@"Evento agendado para %@",[self.datePicker date]]delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}

- (IBAction)didTouchPickerDate:(id)sender {
    
    NSLog(@"Picker date %@",self.datePicker.date);
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}// para dar dismiss ao teclado

//metodo para abrir uma notifição dentro da app
-(void)openAlert:(NSNotification *)notification{

    NSString *message = [[notification object]valueForKey:@"notification"];
    UIAlertView *alert  = [[UIAlertView alloc]initWithTitle:@"Evento de hoje." message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}

@end
