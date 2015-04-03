--元方法__index 与 __newindex 的使用
--搭配使用可以轻易的构成面向对象

base = { name="base_title" }

function base.spreak()
	return "I'm base"
end

function base.addValue( tab,k,v )
	print( "new add value "..k.."="..v )
end

tab = {}
print( tab.name ) --没有设置元方法
setmetatable( tab,{ __index=base, __newindex=base.addValue } )
print( tab.name ) --设置元方法后
print( tab.spreak() ) --设置元方法后
tab.childnum = 1 	--这里对不存在的childnum赋值，触发__newindex
print( tab.xx )
