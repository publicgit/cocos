print("======================迭代器==========================")
--table式复杂迭代器
function itrs( tab )
	local pos = tab.next + 1
	--修改第二个数据的值
	if pos==2 then 
		tab.data[pos] = 100 
	end

	local v = tab.data[ pos ]

	if v then
		tab.next = pos
		return v
	end
end

function pairs( tab )
	return itrs,tab
end

tab1 = { data={ 10,20,30,40,50 }, next=0 }

for v in pairs(tab1) do
	if v==nil then break end
	print( v )
end