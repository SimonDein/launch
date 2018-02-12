# Description:
# Read the text file in the #process method and pass the text to the block provided in each call.
# Everything you need to work on is either part of the #process method or part of the blocks.
# You need no other additions or changes.

# solution 1 (Not an example of 'sandwich code')
class TextAnalyzer
  def process
    text = File.read("exercises_external_resources/text_sample.txt") # File::read closes the files before returning
    yield(text) # Passing the read bytes from file to the block
  end
end

# solution 2

class TextAnalyzer
  def process
    file = File.open("exercises_external_resources/text_sample.txt") # we return a File object and assign to file
    yield(file.read) # then we call File#read on the file returning a string and yield it
    file.close # lastly the file is closed - Always remember to close a file once it's been used!!!
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts(text.split("\n\n").count) }
analyzer.process { |text| puts(text.split("\n").count) }
analyzer.process { |text| puts(text.split(" ").count) }