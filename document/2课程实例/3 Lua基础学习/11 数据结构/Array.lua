local array1 = {}
local array2 = { 1,10,23,454,675,7 } --固定值初始化\
local array3 = {}
--动态初始化
for i=1,10 do
	array1[i] = i
end

for i=0,10 do
	array3[i] = i
end
print( array1[2] )
print( array2[3] )
--'#'用于获取数组的长度，数组的起始索引必须是1开始，否则得不到正确的值。
print( "array1长度：",#array1 )
print( "array2长度：",#array2 )
print( "array3长度：",#array3,"实际长度为11" )