
--协同程序funB运行时，检查A的状态
function funB( _cor )
	print( "funB check A:",coroutine.status( _cor ) ) 	--正常状态
end

local corB = coroutine.create( funB )

--在协同程序A运行时，唤醒协同程序B
function funA( _cor )
	print( "A:",coroutine.status( _cor ) )
	coroutine.resume(corB,_cor)
end

local corA = coroutine.create( funA )

print( "A:",corA )
print( "A:",coroutine.status( corA ) )
coroutine.resume(corA,corA)			--唤醒协同程序A
print( "A:",coroutine.status( corA ) )	--协同程序A结束时状态
