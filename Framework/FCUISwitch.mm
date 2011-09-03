/*
 Copyright (C) 2011 by Martin Linklater
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#if TARGET_OS_IPHONE

#import "FCUISwitch.h"

@implementation FCUISwitchDef

@synthesize rect;
@synthesize userDefaultsID;
@synthesize target;
@synthesize action;
@synthesize parentView;
@synthesize textString;

-(id)init
{
	self = [super init];
	if (self) {
		//blah
	}
	return self;
}

-(void)dealloc
{
	[super dealloc];
}

+(FCUISwitchDef*)def
{
	FCUISwitchDef* thisDef = [[FCUISwitchDef alloc] init];
	thisDef.textString = nil;
	thisDef.userDefaultsID = nil;
	thisDef.parentView = nil;
	thisDef.rect = CGRectMake(0,0,0,0);
	thisDef.target = nil;
	thisDef.action = nil;
	return [thisDef autorelease];
}
@end

#endif // TARGET_OS_IPHONE