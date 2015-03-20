--
-- Author: Rich
-- Date: 2015-03-19 
-- 编译、执行

--[[
	dofile函数的原理，loadfile是其内核
function dofile( filename )
	local fun = assert( loadfile( filename ) )
	return fun()
end
--]]
print("=====================dofile======================")
-- dofile  直接加载并运行Lua代码块
-- 不返回编译结果
local x = dofile( "Module.lua" )
speak()		--直接调用加载外部Lua代码块的函数
print( "x=",x ) --为nil

print("=====================loadfile======================")

-- loadfile  只编译Lua代码块并不运行
-- 返回编译结果函数
local x = loadfile( "Module.lua" )
print( "x=",x )
x() 		--不调用编译结果函数，将不能调用代码块中的全局变量及函数
speak()		--直接调用加载外部Lua代码块的函数，如未调用x()将会引发一个错误

print("=====================loadstring======================")

-- loadstring  从字符串中编译代码块，并不运行
-- 返回编译结果函数
local x = loadstring( "value = value + 1" )
print( "x=",type( x ) ) --x是一个函数
value = 0 				--定义value，如不定义x()将会产生错误（a nil value）
x() 					--执行函数x
print( "value=", value )--value值被改变

print("=====================dostring======================")

-- dostring  从字符串中编译代码块，并运行
-- 返回编译结果函数
function dostring( stringcode )
	local x = assert( loadstring( stringcode ) )
	return x()
end
value = 0
dostring( "value = value + 1"  )
print ( value )

print("=============loadstring 局部变量及变长参数=============")

--loadstring 在字符串中声明局部变量，以及变长参数
fun1 = loadstring( "local value = 0;value = value + 1;print('fun1',value)" )
fun2 = loadstring( "local value1,value2 = ...;print('fun2',value1,value2)" )
fun1()
fun2(2)
fun2(2,3)
fun2(2,3,4)