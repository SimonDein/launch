# In Ruby all methods can take a block - though nothing will happen
# unless you yield or call to the block:
def hello
  "hello"
end

hello { puts "yo"}
#=> hello

def hello
  yield
  "hello"
end

hello { puts "yo"}
# yo
# => hello

def hello(&block)
  block.call
end

hello { puts 'yo' }

# Here we yield to the block on line 22 - then execute the rest of the method
def say(words)
  yield
  puts words
end

say("World!") { puts "Hello"}
# Hello - the block executes (because it's the first line in the method implementation)
# World! - then the rest of the method is evaluated
# => nil - nil is returned at puts is the last expression evaluated and always returns nil

def say(words)
  yield if block_given?
  puts "> " + words
end


say("Hey from the method") { puts "Hi from the block"}
# Hi from the block
# > Hey from the method
# => nil (last line evaluated is invoking the puts method - always returns nil)