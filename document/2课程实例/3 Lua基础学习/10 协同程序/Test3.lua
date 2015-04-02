--管道与过滤器filter
--生产者与消费者通过过滤器进行值传递
--这种模式通过消费者驱动生产者进行产生。

--计数器函数
function getCount( x )
	return function()
		x=x+1
		return x
	end
end
--创建闭合计数器
local count = getCount(0)
--发送新值
function send(x)
	coroutine.yield(x)
end
--启动一个协同程序
function receive( pro )
	local status,value = coroutine.resume( pro )
	return value
end
--生产者
function producter()
	while true do
		send( count() )
	end
end
--过滤器，接受一个生产者
function filter( pro )
	local x = 0
	return function()
		while true do
			x = receive( pro )
			send(x)
		end
	end
end
--消费者，接受一个生产者协同程序及控制条件，控制条件防止死循环
--假设有100个消费者，驱动生产者来生产
function consumer( pro,num )
	local x = 0
	while x < num do
		x = receive( pro )
		print( x )
	end
end

local pro = coroutine.create( producter )
local fil = coroutine.create( filter( pro ) )
consumer( fil,100 )

print( "消费者协同程序状态：",coroutine.status(pro) )
print( "生产者协同程序状态：",coroutine.status(fil) )


