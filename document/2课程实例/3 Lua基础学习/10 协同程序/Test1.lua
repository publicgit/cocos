--resume与yield的参数传递

function funA( _cor )
	print( "A:",coroutine.status(_cor) )
	print( coroutine.yield() )		--挂起
end
local corA = coroutine.create( funA )	--创建协同程序
coroutine.resume( corA,corA )		--启动，没有yield等待，参数属于主函数
print( "A:",coroutine.status(corA) )
coroutine.resume( corA,1,2,3 )	--从挂起处启动，并给yield传递参数
print( "A:",coroutine.status(corA) )