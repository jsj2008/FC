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

#import "FCPhysics2DJoint.h"

#pragma mark - FCPhysics2DJoint

@implementation FCPhysics2DJoint
@end

#pragma mark - FCPhysics2DJointCreateDef

@implementation FCPhysics2DJointCreateDef
@synthesize body1 = _body1;
@synthesize body2 = _body2;
@end

#pragma mark - FCPhysics2DDistanceJointCreateDef

@implementation FCPhysics2DDistanceJointCreateDef
@synthesize pos1 = _pos1;
@synthesize pos2 = _pos2;
@end

#pragma mark - FCPhysics2DRevoluteJointCreateDef

@implementation FCPhysics2DRevoluteJointCreateDef
@synthesize pos = _pos;
@end

#pragma mark - FCPhysics2DPrismaticJointCreateDef

@implementation FCPhysics2DPrismaticJointCreateDef
@synthesize axis = _axis;
@end

#pragma mark - FCPhysics2DRopeJointCreateDef

@implementation FCPhysics2DRopeJointCreateDef
@synthesize bodyAnchor1 = _bodyAnchor1;
@synthesize bodyAnchor2 = _bodyAnchor2;
@end

#pragma mark - FCPhysics2DPulleyJointCreateDef

@implementation FCPhysics2DPulleyJointCreateDef
@synthesize bodyAnchor1 = _bodyAnchor1;
@synthesize bodyAnchor2 = _bodyAnchor2;
@synthesize groundAnchor1 = _groundAnchor1;
@synthesize groundAnchor2 = _groundAnchor2;
@synthesize ratio = _ratio;
@end
