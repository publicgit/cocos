--
-- Author: Rich
-- Date: 2015-02-09 09:46:48
--

--全局变量不需要声明，直接赋值给变量即可，（local）是局部变量声明。

local iValue = 100 									--数字number
local fValue = 100.1                      			--数字number
local strValue = "hello world" 						--字符串
local bValue = true 								--布尔
local funValue = function ( ... ) end 				--函数
local nValue = nil  								--空
local tValue = {100,"hello world",true,100.1,nil}	--表

if( type(iValue) == "number" ) then     			--等同于if type(iValue) == "number" then
	print( "It is number", iValue )
end

if( type(fValue) == "number" ) then     			
	print( "It is number", fValue )
end

if( type(strValue) == "string" ) then     			
	print( "It is string", strValue )
end

if( type(bValue) == "boolean" ) then     			
	print( "It is boolean", bValue )
end

if( type(funValue) == "function" ) then     			
	print( "It is function", funValue )
end

if( type(nValue) == "nil" ) then     			
	print( "It is nil", nValue )
end

if( type(tValue) == "table" ) then     			
	print( "It is table", tValue, "(table is index begin of No.1)-->", tValue[2] )
end