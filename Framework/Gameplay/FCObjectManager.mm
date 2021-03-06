/*
 Copyright (C) 2011-2012 by Martin Linklater
 
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

#import "FCObjectManager.h"
#import "FCXMLData.h"
#import "FCTypes.h"

static FCObjectManager* s_pInstance;

#pragma mark - Lua Interface

@implementation FCObjectManager

@synthesize nulls = _nulls;

+(FCObjectManager*)instance
{
	if (!s_pInstance) {
		s_pInstance = [[FCObjectManager alloc] init];
	}
	return s_pInstance;
}

-(id)init
{
	self = [super init];
	if (self) {
		_nulls = [NSMutableDictionary dictionary];
	}
	return self;
}

-(void)addObjectsFromResource:(FCResource*)resource
{
	// add nulls
	NSArray* gameplayObjects = [resource.xmlData arrayForKeyPath:@"fcr.gameplay.game"];

	for( NSDictionary* obj in gameplayObjects )
	{
		NSString* objType = [obj valueForKey:kFCKeyType];
		
		if ([objType isEqualToString:kFCKeyNull]) {
			NSString* nullId = [[obj valueForKey:kFCKeyName] stringByReplacingOccurrencesOfString:@"_g_" withString:@""];
			[_nulls setValue:obj forKey:nullId];
		}
		// etc
	}
}

-(void)reset
{
	_nulls = [NSMutableDictionary dictionary];
}

@end
