//
//  WebConnection.m
//  Words
//
//  Created by David Stalnaker on 1/8/11.
//  Copyright 2011 Rochester Institute of Technology. All rights reserved.
//

#import "WebConnection.h"


@implementation WebConnection

- (id)initWithDelegate:(id <WebConnectionDelegate>)del {
	self = [super init];
	if(self) {
		delegate = del;
	}
	return self;
}

- (void)newConnectionWithURL:(NSURL*)url {
	
	NSURLRequest *theRequest=[NSURLRequest requestWithURL:url
											  cachePolicy:NSURLRequestUseProtocolCachePolicy
										  timeoutInterval:60.0];
	connection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
	if(connection) {
		recievedData = [[NSMutableData alloc] init];
	}
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {

}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {	
	[recievedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	[delegate finishedLoading:recievedData];
}

@end
