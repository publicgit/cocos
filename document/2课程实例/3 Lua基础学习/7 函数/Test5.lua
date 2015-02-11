--
-- Author: Rich
-- Date: 2015-02-14 20:18:39
--闭合函数，局部函数，尾调用，非局部变量

--[[
若将一个函数写在另一个函数之内，那么这个位于内部的函数便可以访问外部函数中的
局部变量，这项特征称之为“词法域”
--]]


print("====================闭合函数 and 非全局变量============================")

function getCount()
	local count = 0
	return function ()
		count=count+1
		return count 		--在匿名函数内部的count既不是全局变量，也不是局部变量，为非局部变量
	end
end

count = getCount()

print(count())
print(count())
print(count())

print("====================非全局函数============================")

--[[只要将一个函数存储到一个局部变量中，就能得到一个“局部函数”
也就是说只能在作用域中使用]]

tab = { goo = function (x,y) return x+y end }
tab.too = function (x,y) return x*y end
function tab.foo(x,y)
	return x/y
end

--通过local定义局部函数

local function coo( x,y )
	print( x-y )
end

print( tab.goo(2,3) )
print( tab.too(2,3) )
print( tab.foo(2,3) )

coo(2,3)

print("====================尾调用============================")

--当一个函数调用是另一个函数的最后一个动作时，该调用才是“尾调用”

function test1( str )
	return test2( str )
end

function test2( str )
	print( str.."test2" )
end

function test3( str )
	return ( test2( str ) )  --非尾调用
end

function test4( str )
	test2( str ) --非尾调用
end

test1("test1尾调用")
test3("test3非尾调用")
test4("test4非尾调用")