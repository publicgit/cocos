local array1 = {}
local array2 = { 1,10,23,454,675,7 } --�̶�ֵ��ʼ��\
local array3 = {}
--��̬��ʼ��
for i=1,10 do
	array1[i] = i
end

for i=0,10 do
	array3[i] = i
end
print( array1[2] )
print( array2[3] )
--'#'���ڻ�ȡ����ĳ��ȣ��������ʼ����������1��ʼ������ò�����ȷ��ֵ��
print( "array1���ȣ�",#array1 )
print( "array2���ȣ�",#array2 )
print( "array3���ȣ�",#array3,"ʵ�ʳ���Ϊ11" )