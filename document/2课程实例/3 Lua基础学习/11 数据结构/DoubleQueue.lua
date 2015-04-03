--双向队列的实现

DoubleQueue = {}

function DoubleQueue.new()
	local Queue = { first = 0, last = -1 }
	function Queue.pushFirst( queue,value )
		local first = queue.first -1
		queue.first = first
		queue[ first ] = value
	end

	function Queue.popFirst( queue )
		local first = queue.first
		if first > queue.last then error(" queue is empty! ") end
		local value = queue[first]
		queue[first] = nil
		queue.first = first +1
		return value
	end

	function Queue.pushLast( queue,value )
		local last = queue.last +1
		queue.last = last
		queue[last] = value
	end

	function Queue.popLast( queue )
		local last = queue.last
		if last < queue.first then error( " queue is empty! " ) end
		local value = queue[last]
		queue[last] = nil
		queue.last = last -1
		return value
	end

	function Queue.len( queue )
		return queue.last - queue.first +1
	end

	return Queue
end
