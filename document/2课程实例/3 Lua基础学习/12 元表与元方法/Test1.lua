--算术元方法的应用，在使用算术操作符时，查找元表中是否有元方法
Set = {}
function Set.sub( tab1,tab2 )
	local subTab = {}
	for k,v in pairs(tab1) do
		if( v==nil ) then break end
		subTab[k] = tab1[k] - tab2[k] 
	end
	return subTab
end
--设置减法的元方法
Set.__sub = Set.sub

table1 = { x=1 }
table2 = { x=2 }

setmetatable( table1,Set )
setmetatable( table2,Set )
--求值
local t = table1 - table2
--打印值t
for k,v in pairs(t) do
	if( v==nil ) then break end
	print( k,v ) 
end