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

#import <Foundation/Foundation.h>

enum FCPhaseUpdate {
	kFCPhaseUpdateOK,
	kFCPhaseUpdateDeactivate
};

enum FCPhaseState {
	kFCPhaseStateInactive,
	kFCPhaseStateActivating,
	kFCPhaseStateUpdating,
	kFCPhaseStateDeactivating
};

@protocol FCPhaseDelegate <NSObject>
-(FCPhaseUpdate)update:(float)dt;
@optional
-(void)wasAddedToQueue;
-(void)wasRemovedFromQueue;
-(float)willActivate;
-(void)willActivatePostLua;
-(void)isNowActive;
-(void)isNowActivePostLua;
-(float)willDeactivate;
-(void)willDeactivatePostLua;
-(void)isNowDeactive;
-(void)isNowDeactivePostLua;
@end

@interface FCPhase : NSObject {
	NSString* _name;
	NSString* _namePath;
	__weak FCPhase* _parent;
	NSMutableDictionary* _children;
	FCPhase* _activeChild;
	__weak id<FCPhaseDelegate> _delegate;
	float _activateTimer;
	float _deactivateTimer;
	FCPhaseState _state;
	
#if defined (FC_LUA)
	NSString* _luaTable;
	BOOL _luaLoaded;
	
	NSString* _luaUpdateFunc;
	NSString* _luaWasAddedToQueueFunc;
	NSString* _luaWasRemovedFromQueueFunc;
	NSString* _luaWillActivateFunc;
	NSString* _luaIsNowActiveFunc;
	NSString* _luaWillDeactivateFunc;
	NSString* _luaIsNowDeactiveFunc;
#endif
}
@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSString* namePath;
@property(nonatomic, weak) FCPhase* parent;
@property(nonatomic, strong) NSMutableDictionary* children;
@property(nonatomic, strong) FCPhase* activeChild;
@property(nonatomic, weak) id<FCPhaseDelegate> delegate;
@property(nonatomic) float activateTimer;
@property(nonatomic) float deactivateTimer;
@property(nonatomic) FCPhaseState state;

#if defined (FC_LUA)
@property(nonatomic, strong) NSString* luaTable;
@property(nonatomic, readonly) BOOL luaLoaded;

@property(nonatomic, strong) NSString* luaUpdateFunc;
@property(nonatomic, strong) NSString* luaWasAddedToQueueFunc;
@property(nonatomic, strong) NSString* luaWasRemovedFromQueueFunc;
@property(nonatomic, strong) NSString* luaWillActivateFunc;
@property(nonatomic, strong) NSString* luaIsNowActiveFunc;
@property(nonatomic, strong) NSString* luaWillDeactivateFunc;
@property(nonatomic, strong) NSString* luaIsNowDeactiveFunc;
#endif

-(id)initWithName:(NSString*)name;

-(FCPhaseUpdate)update:(float)dt;

-(void)wasAddedToQueue;
-(void)wasRemovedFromQueue;
-(void)willActivate;
-(void)isNowActive;
-(void)willDeactivate;
-(void)isNowDeactive;

@end
