--创建矩阵，多维数组
function createMatrix( N,M )
	local matrix = {}
	for idx=1,N do
		matrix[idx] = {}
		for idy=1,M do
			matrix[idx][idy] = 0
		end
	end
	return matrix
end
--合并索引的矩阵
function createMatrixByString( N,M,S )
	local matrix = {}
	for idx=1,N do
		for idy=1,M do
			matrix[idx..S..idy] = 0
		end
	end
	return matrix
end

--合并索引的矩阵
function createMatrixByValue( N,M )
	local matrix = {}
	for idx=1,N do
		for idy=1,M do
			matrix[ ( idx - 1 )*M + idy ] = 0
		end
	end
	return matrix
end


--创建4X5的矩阵
local matrix = createMatrix( 4,5 )
local matrixstr = createMatrixByString( 4,5,"_" )
local matrixVal = createMatrixByValue( 4,5 )
print("==============多维数组矩阵===============")
for k,v in pairs(matrix) do
	print(unpack(v))
end
print("==============基于合并索引的矩阵（String）===============")
for k,v in pairs(matrixstr) do
	print(k,v)
end
print("==============基于合并索引的矩阵（Value）===============")
for k,v in pairs(matrixVal) do
	print(k,v)
end