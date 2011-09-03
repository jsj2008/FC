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

#import "FCPhysics2DBodyDef.h"
#import "FCKeys.h"

@implementation FCPhysics2DBodyDef
@synthesize angle = _angle;
@synthesize isStatic = _isStatic;
@synthesize shapeDef = _shapeDef;
@synthesize canSleep = _canSleep;
@synthesize world = _world;
@synthesize actor = _actor;
@synthesize linearDamping = _linearDamping;

-(void)dealloc
{
	self.shapeDef = nil;
	[super dealloc];
}

-(FC::Vector2f)position
{
	return mPosition;
}

-(void)setPosition:(FC::Vector2f)newPos
{
	mPosition = newPos;
}

+(FCPhysics2DBodyDef*)defaultDef
{
	FCPhysics2DBodyDef* def = [[FCPhysics2DBodyDef alloc] autorelease];
	
	[def setPosition:FC::Vector2f(0.0f, 0.0f)];
	def.angle = 0.0f;
	def.actor = nil;
	def.isStatic = NO;
	def.shapeDef = nil;
	def.canSleep = YES;
	def.linearDamping = kFCInvalidFloat;
	def.world = 0;
	return def;
}

-(NSString*)description
{
	NSMutableString* ret = [NSMutableString stringWithString:@"FCPhysics2DBody:"];
	[ret appendFormat:@"pos %f, %f\n", mPosition.x, mPosition.y];
	[ret appendFormat:@"rot %f\n", self.angle];
	[ret appendFormat:@"linear damping %f\n", self.linearDamping];
	[ret appendFormat:@"static %@\n", (self.isStatic) ? @"yes" : @"no"];
	[ret appendFormat:@"can sleep %@\n", (self.canSleep) ? @"yes" : @"no"];
	[ret appendFormat:@"shapeDef %@\n", self.shapeDef];
	[ret appendFormat:@"actor %@\n", self.actor];
	return ret;
}

@end