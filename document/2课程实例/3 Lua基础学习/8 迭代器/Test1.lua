print("======================迭代器==========================")
-- 闭合函数迭代器
function itrs( tab )
	local k = 0 
	return function ()
		k=k+1
		return tab[k]
	end
end

tab1 = {10,20,30,40,50}

iterator = itrs(tab1)

while( true ) do
	local v = iterator()
	if v==nil then break end
	print( "while: ",v )
end

for v in itrs(tab1) do
	if v==nil then break end
	print( "泛型for：",v )
end