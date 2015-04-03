--链表的实现
--递归创建链表
function createList( n )
	n = n or 0
	n = n+1
	if( n > 10 ) then return nil end
	local list = {}
	list.value = n
	list.next = createList( n )
	return list
end
--链表迭代器
function iterator( list )
	return function()
		if not list then
			return nil			
		end
		local value = list.value
		list = list.next
		return value
	end
end

local list = createList()
for v in iterator( list ) do
	if v then 
		print(v)
	else
		break
	end
end