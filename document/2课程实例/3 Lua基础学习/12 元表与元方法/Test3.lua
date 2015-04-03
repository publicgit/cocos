--库元方法的应用__metatable
Set = {}
function Set.tostring( tab )
	local t = {}
	for v in pairs(tab) do
		t[#t+1] = v
	end
	return "{"..table.concat(t,",").."}" --连接
end
--设置减法的元方法
Set.__metatable = "not change value"
table1 = { 1,2,3,4 }
setmetatable( table1,Set ) --设置元表

print( getmetatable(table1) )
--修改元表,这里会报错：cannot change a protected metatable
setmetatable(table1, {}) 	
