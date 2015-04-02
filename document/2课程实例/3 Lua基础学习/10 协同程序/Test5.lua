--以协同程序实现Lua迭代器

local tab = { 1,2,3,4,5,6 }

function corFun( tab,num )
	num = num or 0
	return function()
		while true do
			num = num +1
			if( num > #tab ) then return end
			coroutine.yield(tab[num])
		end
	end
end

function cor( tab )
	local cor = coroutine.create( corFun( tab ) )
	return function ()--迭代器
		local status,value = coroutine.resume( cor )
		return value
	end
end

for v in cor( tab ) do
	if v then
		print(v)
	else
		break
	end
end