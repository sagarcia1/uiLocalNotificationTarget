//
//  AppDelegate.m
//  UILocalNotification
//
//  Created by Marcelo Garcia on 5/17/15.
//  Copyright (c) 2015 Marcelo Garcia. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //Chama a notificação
    UILocalNotification *locationNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (locationNotification) {
        //seta  icone para zero
        application.applicationIconBadgeNumber = 0;
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


//caso o aplicativo esteja aberto
-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    UIApplicationState state = [application applicationState];
    if (state == UIApplicationStateActive) {
        //somente chama uma alertview
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Reminder"
                                                        message:notification.alertBody
                                                       delegate:self cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }else{
        NSDictionary *dictionary = [NSDictionary dictionaryWithObject:notification.alertBody forKey:@"notification"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"task" object:dictionary];
        
    }
    

    
//reseta o badge
    application.applicationIconBadgeNumber = 0;

}



@end
