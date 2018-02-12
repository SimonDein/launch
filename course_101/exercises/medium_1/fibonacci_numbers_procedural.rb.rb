# In the previous exercise, we developed a recursive solution to calculating the nth Fibonacci number.
# In a language that is not optimized for recursion, 
#ome (not all) recursive methods can be extremely slow and require massive quantities of memory and/or stack space.

# Ruby does a reasonably good job of handling recursion, but it isn't designed for heavy recursion; as a result,
# the Fibonacci solution is only useful up to about fibonacci(40).
# With higher values of nth, the recursive solution is impractical. 
# (Our tail recursive solution did much better, but even that failed at around fibonacci(8200).)

# Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.

# Rewrite your recursive fibonacci method so that it computes its results without recursion.

# solution 1
# def fibonacci(n)
#   return 1 if n <= 2
#   fib = 0
#   f1 = 1
#   f2 = 1
#   (n - 2).times do
#     fib = f1 + f2
#     f2 = f1
#     f1 = fib
#   end
#   fib
# end

# solution 2
def fibonacci(n)
  f1, f2 = [1, 1]
  3.upto(n) do
    f1, f2 = [f1 + f2, f1]
  end
  f1
end

puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
puts fibonacci(100_001) # => 4202692702.....8285979669707537501