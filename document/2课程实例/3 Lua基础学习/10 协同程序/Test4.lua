--关于coroutine.wrap 函数的应用
function getCount( num )
	return function ()
		num = num+1
		return num
	end
end
--创建计数器函数
local count = getCount(0)
--协同程序，每一次唤醒将会计数器增加
function corA()
	while true do
		print( count() )
		coroutine.yield()
	end
end
--创建系统程序，返回一个函数，每调用一次，就会唤醒一次协同程序
local cor = coroutine.wrap( corA )
cor()	
cor()	
cor()