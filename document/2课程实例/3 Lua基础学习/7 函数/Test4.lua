--
-- Author: Rich
-- Date: 2015-02-09 14:31:27
--

--函数 function

--格式
function function_name( ... )    ---- 等同于 function_name=function( ... )  --body  end
	-- body
end



function fun1()
	return "10"
end

function fun2()
	return "10",20,false
end

function fun3( str1,str2,str3,str4 )
	print(str1,str2,str3,str4)
end

print("==========================多重返回值==============================")

--多重返回值
--多余的返回值将会被丢弃
--缺少的返回值将会以nil代替
local x,y = fun1() 	--缺少y的返回值，nil代替
print("多重赋值x,y",x,y)

x,y = fun2() 		--丢弃 false
print("多重赋值x,y",x,y)

print("========================================================")

--函数在表达式中，不是以最后一个表达式元素将会只产生一个返回值
local z

x,y,z = 10,fun2()
print("多重赋值x,y,z",x,y,z)

x,y,z = fun2(),"hello"			--fun2()只产生一个返回值，z没有返回值以nil代替
print("多重赋值x,y,z",x,y,z)

print("=========================函数unpack ===============================")
--函数unpack    
--把数组里面的所有值传入函数
local tab1 = {"hello","world","lua"}
fun3( "unpack test", unpack(tab1) )


print("==========================变长参数：...==============================")
--变长参数：...

function fun4( ... )
	local str=""
		for i,v in ipairs{...} do
			print(i,v)
			str=str..v
		end
	return str
end

print( fun4("hello","world","lua") )

print("========================函数select================================")
--函数select
--访问所有变长参数

function fun5( x,... )
	local i
	for i=1, select('#',...) do
		local str = select(i,...)
		print(str)
	end
end
fun5(10,20,30,40,50,60)


print("========================函数具体实参================================")
--设置默认值，用两个函数来完成，也可以在函数内写
function fun6( x,y,width,height,isDesc )
	fun7( x,y,width or 100, height or 200, isDesc or "title" )
end
function fun7( x,y,width,height,isDesc )
	print(x ,y,width,height,isDesc)
end

fun6(10,20,400)