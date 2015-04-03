--库元方法的应用__tostring
Set = {}
function Set.tostring( tab )
	local t = {}
	for v in pairs(tab) do
		t[#t+1] = v
	end
	return "{"..table.concat(t,",").."}" --连接
end
--设置减法的元方法
Set.__tostring = Set.tostring

table1 = { 1,2,3,4 }

setmetatable( table1,Set )

print( table1 )

