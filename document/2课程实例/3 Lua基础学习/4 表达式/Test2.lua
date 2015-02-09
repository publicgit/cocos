--
-- Author: Rich
-- Date: 2015-02-09 10:46:31
--


--算术操作符：”+”（加法）,”-”（减法）,”*”（乘法）,”/”（除法）,”^”（指数）,”%”（取模）,一元的”-”（负号）
local x = 3
local y = 4
print("x+y = ", x+y)
print("x-y = ", x-y)
print("x*y = ", x*y)
print("x/y = ", x/y)
print("x^y = ", x^y)
print("y%x = ", y%x)
print("-x = ", -x)


print("=======================================================")
--关系操作符：”<”,”>”,”<=”,”>=”,”==”,”~=”；所有这些操作符的运算结果都是true或false
local a = 10
local b = 20

print("a > b",a>b)
print("a < b",a<b)

local table1 = {x=10,y=60}
local table2 = {x=10,y=60}
local table3 = table2

print("table1 == table2", table1 == table2 )
print("table1 ~= table2", table1 ~= table2 )
print("table2 == table3", table2 == table3 )

print("=======================================================")
--字符串连接：..
local str1 = "hello"
local str2 = " world"
local str3 = str1..str2..101
print(str3)


print("=======================================================")
--逻辑操作符：and、or、not。 不返回简单的true和false，而是返回操作数也就是确切的值
--除了false、nil 视为假，其他都是真
print( "10 and 14",  10 and 14 )
print( "10 or 14",  10 or 14 )
print( "10 not 14",  10 and 14 )
print( "false and 14",  false and 14 )
print( "true and 14",  true and 14 )
print( "false or 14",  false or 14 )
print( "true or 14",  true or 14 )
print( "nil or 14",  nil or 14 )

print("=======================================================")
--table的构造与使用，构造table使用{}创建一个空的table
local tab1 = {}
local tab2 = { x="hello", y="world", g="lua" }
local tab3 = { "one", "two", "three", "four", "five" }
local name = "z"

tab2[name] = "Lua!"   --添加
tab2.g = nil   --删除

print("tab1 == nil",tab1==nil)
print("tab2.x=", tab2.x)
print("tab2['y']=", tab2["y"])

print("tab2[name]=", tab2[name])
print("tab2['name']=", tab2["name"])
print("tab2[z]=", tab2['z'])
print(tab2.x, tab2.y, tab2.z)

print("tab3[0]=", tab3[0])
print("tab3[1]=", tab3[1])
print("tab3 is length", #tab3)


print("=======================================================")