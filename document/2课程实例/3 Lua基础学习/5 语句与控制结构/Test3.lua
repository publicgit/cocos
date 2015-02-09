--
-- Author: Rich
-- Date: 2015-02-09 11:46:14
--

--局部变量与块
x = 10 			--全局变量
local y = 100  	--局部变量

do
	local a = 1
	local b = 10
	x = x+a+b
end 			--在do-end块结束时，a、b作用域结束

print("x,a,b",x, a, b)

print("=======================================================")
--多重赋值

local a,b,c = 10,20
local x,y,z = 100,200,300,400,500
print("多重赋值-少赋值设为nil",a,b,c)
print("多重赋值-多赋值舍去",x,y,z)


print("=======================================================")

--控制语句  if-then-else 及 elseif

if 4 > 5 then
	print("No.1")
elseif 4 > 3 then
	print("No.2")
else
	print("No.3")
end

print("=======================================================")

--控制语句  while
local index = 1
local tab = {10,20,30,40}
while tab[index] do
	print("while", tab[index])
	index = index + 1
end

--控制语句  repeat--until  至少执行一次
index = 1
repeat
	print("repeat--until", tab[index])
	index = index + 1
until tab[index] == nil


print("=======================================================")

--控制语句 数字型for i,v do-end、泛型for i,v in pairs(t) do-end、

local table1 = {x="one",y="two",z="three"}
local table2 = {"No.1","No.2","No.3","No.4"}

local i
for i=1,#table2 do
	print("Number type", table2[i])
end

for k,v in pairs(table1) do
	print("iterator type",k,v)
end
--遍历数组泛型for i,v in ipairs(a) do-end
for i,k in ipairs(table2) do
	print("遍历数组泛型iterator type",i,k)
end

print("=======================================================")
--流程控制 break、return 这里的 break跳出一个循环体，注：lua中没有continue
for i=1,10 do
	if( i == 5 ) then 
		break
	end
	print("流程控制",i)
end

print("=======================================================")