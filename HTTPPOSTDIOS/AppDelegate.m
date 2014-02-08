//
//  AppDelegate.m
//  HTTPPOSTDIOS
//
//  Created by OSX on 2014-01-19.
//  Copyright (c) 2014 OSX. All rights reserved.
//

#import "AppDelegate.h"
#import "DIOSNode.h"
#import "DIOSFile.h"
#import "Settings.h"
#import <SystemConfiguration/SystemConfiguration.h>


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];

  
	
	
	
	
//****** Post operation
	
	NSMutableDictionary *nodeData = [NSMutableDictionary new];
	[nodeData setValue:@"AFNetworking Test Object Test 2" forKey:@"title"];
	
	NSDictionary *bodyValues = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"a test body", nil] forKeys:[NSArray arrayWithObjects:@"value", nil]];
	NSDictionary *languageDict = [NSDictionary dictionaryWithObject:[NSArray arrayWithObject:bodyValues] forKey:@"und"];
	[nodeData setObject:languageDict forKey:@"body"];
	
	NSDictionary *logitude = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"34.02127", nil] forKeys:[NSArray arrayWithObjects:@"value", nil]];
	NSDictionary *logitudestr = [NSDictionary dictionaryWithObject:[NSArray arrayWithObject:logitude] forKey:@"und"];
	[nodeData setObject:logitudestr forKey:@"field_longitude"];
	
	NSDictionary *latitude = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"122.02127", nil] forKeys:[NSArray arrayWithObjects:@"value", nil]];
	NSDictionary *loatitudestr = [NSDictionary dictionaryWithObject:[NSArray arrayWithObject:latitude] forKey:@"und"];
	[nodeData setObject:loatitudestr forKey:@"field_latitude"];
	
	[nodeData setObject:@"location" forKey:@"type"];
	
	[nodeData setObject:@"und" forKey:@"language"];
	
	
	[DIOSNode nodeSave:nodeData success:^(AFHTTPRequestOperation *operation, id responseObject) {
		NSLog(@" Response Object: %@ ", responseObject);
		NSLog(@" Response Operation String: %@ ", operation);
		//Successful node Creation
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		//WE failed to upload the node
	}];
	
	
//****** File Upload Operation
	
	NSMutableDictionary *fileData = [NSMutableDictionary new];
	NSData *imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"bg.png"], 0.5);
	[fileData setObject:@"temp" forKey:@"name"];
	[fileData setObject:@"temp.jpg" forKey:@"fileName"];
	[fileData setObject:imageData forKey:@"fileData"];
	[fileData setObject:@"image/png" forKey:@"mimetype"];
	[fileData setObject:@"field_image" forKey:@"field_name"];
	[fileData setObject:@"4" forKey:@"nid"];
//	[node nodeAttachFile:fileData];
	
	
	
	
	
	
	
	
	[self.window makeKeyAndVisible];
	
	
	
	
	
	
	
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
