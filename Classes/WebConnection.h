//
//  WebConnection.h
//  Words
//
//  Created by David Stalnaker on 1/8/11.
//  Copyright 2011 David Stalnaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebConnectionDelegate.h"

@interface WebConnection : NSObject {
	id <WebConnectionDelegate> delegate;
	NSMutableData *recievedData;
	NSURLConnection *connection;
}

- (id)initWithDelegate:(id <WebConnectionDelegate>)del;
- (void)newConnectionWithURL:(NSURL*)url andPostData:(NSData *)postData;

@end
