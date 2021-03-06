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

#import "FCLuaCommon.h"

#import "FCError.h"

void FCLua_DumpStack( lua_State* _state )
{
	NSString* hexAddress = [NSString stringWithFormat:@"0x%08x", _state];
	FC_UNUSED(hexAddress);
	FC_LOG1(@"-- FCLuaVM:dumpStack (%@) --", hexAddress);
	int i;
	int top = lua_gettop(_state);
	for( i = 1 ; i <= top ; i++ )
	{
		int t = lua_type(_state, i);
		int negIndex = -(top - i) -1;
		FC_UNUSED(negIndex);
		switch(t)
		{
			case LUA_TSTRING:
				FC_LOG3(@"(%@/%@) string '%@'", [NSNumber numberWithInt:i], [NSNumber numberWithInt:negIndex], [NSString stringWithUTF8String:lua_tostring(_state, i)]);
				break;
			case LUA_TBOOLEAN:
				FC_LOG3(@"(%@/%@) boolean %@", [NSNumber numberWithInt:i], [NSNumber numberWithInt:negIndex], (lua_toboolean(_state, i) ? @"true" : @"false") );
				break;
			case LUA_TNUMBER:
				FC_LOG3(@"(%@/%@) number %@", [NSNumber numberWithInt:i], [NSNumber numberWithInt:negIndex], [NSNumber numberWithDouble:lua_tonumber(_state, i)]);
				break;
			case LUA_TLIGHTUSERDATA:
				FC_LOG2(@"(%@/%@) userdata", [NSNumber numberWithInt:i], [NSNumber numberWithInt:negIndex] );
				break;
			default:
				FC_LOG3(@"(%@/%@) %@", [NSNumber numberWithInt:i], [NSNumber numberWithInt:negIndex], [NSString stringWithUTF8String:lua_typename(_state, t)]);
				break;
		}
	}
}

double FCLua_GetTableNumber( lua_State* _state, int stackIdx, const char* name )
{
	lua_getfield(_state, stackIdx, name);

	FC_ASSERT( lua_isnumber(_state, stackIdx) );
	
	double ret = lua_tonumber(_state, stackIdx);
	lua_pop(_state, 1);
	return ret;
}

NSString* FCLua_GetTableString( lua_State* _state, int stackIdx, const char* name )
{
	lua_getfield(_state, stackIdx, name);
	
	FC_ASSERT( lua_isstring(_state, stackIdx) );

	NSString* ret = [NSString stringWithUTF8String:lua_tostring(_state, stackIdx)];
	lua_pop(_state, 1);
	return ret;
}

BOOL FCLua_GetTableBool( lua_State* _state, int stackIdx, const char* name )
{
	lua_getfield(_state, stackIdx, name);
	
	FC_ASSERT( lua_isboolean(_state, stackIdx) );

	BOOL ret = lua_toboolean(_state, stackIdx);
	lua_pop(_state, 1);
	
	return ret;
}

BOOL FCLua_GetTableIsTable( lua_State* _state, int stackIdx, const char* name )
{
	lua_getfield(_state, stackIdx, name);

	BOOL ret = lua_istable(_state, stackIdx);
	lua_pop(_state, 1);
	return ret;
}
