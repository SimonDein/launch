require 'pry'
=begin
Understand the problem:
Enque
  input:
    - integer
  output:

Algorithm
  - if arr full
    - remove oldest object and replace with input
  - else
    - add input after most recent added object

Dequeue
  Input
    -integer

  Output
    - oldest object in arr
    - nil if no content is left in arr

Alogrithm
  - if arr empty?
    - return nil
  - else
    - remove oldest item from arr
=end

class CircularQueue
  attr_reader :queue, :current_index, :oldest_index
  
  def initialize(size)
    @queue = Array.new(size)
    @oldest_index = 0       # holds the index of the oldest item in array
    @current_index = 0
  end

  def enqueue(obj)
    if queue_full? then replace_oldest_object(obj)
    else                add_new(obj)
    end
  end

  def dequeue
    if queue_empty? then return nil
    else                 remove_oldest_object
    end
  end
  
  def queue_empty?
    queue.uniq == [nil]
  end
  
  private

  attr_writer :current_index, :oldest_index


  def queue_full?
    queue.all? { |obj| obj != nil }
  end
  
  def add_new(obj)
    queue[current_index] = obj
    self.current_index = update(current_index)
  end

  def update(index)
    index += 1
    index = 0 if index == queue.size
    index
  end

  def replace_oldest_object(obj)
    queue[oldest_index] = obj
    self.oldest_index = update(oldest_index)
  end

  def remove_oldest_object
    oldest_object = queue[oldest_index]
    queue[oldest_index] = nil
    self.oldest_index = update(oldest_index)
    oldest_object
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil