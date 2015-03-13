print("======================迭代器==========================")
-- 无状态迭代器
function itrs( tab,idx )
	idx = idx+1
	local v = tab[idx]
	if( v ) then 
		return idx,v
	end
end
--包装器
function pairs( tab )
	--itrs迭代器函数，tab恒定状态，0控制变量初始值
	return itrs,tab,0
end

tab1 = {10,20,30,40,50}

for k,v in pairs(tab1) do
	if v==nil then break end
	print( k,v )
end