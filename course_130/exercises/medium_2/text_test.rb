require 'minitest/autorun'

require_relative 'resources_for_testing/text.rb'

class TextTest < Minitest::Test
  def setup
    @file = File.open('resources_for_testing/sample_text.txt')
    @text = Text.new(@file.read)
  end
  
  def test_swap
    expected_string = "Lzrem ipsum dzlzr sit amet, cznsectetur adipiscing elit. Cras sed vulputate ipsum.\nSuspendisse czmmzdz sem arcu. Dznec a nisi elit. Nullam eget nisi czmmzdz, vzlutpat\nquam a, viverra mauris. Nunc viverra sed massa a czndimentum. Suspendisse zrnare justz\nnulla, sit amet mzllis erzs szllicitudin et. Etiam maximus mzlestie erzs, sit amet dictum\ndzlzr zrnare bibendum. Mzrbi ut massa nec lzrem tincidunt elementum vitae id magna. Cras\net varius mauris, at pharetra mi."
    
    assert_equal(expected_string, @text.swap('o', 'z'))
  end
  
  def test_word_count
    assert_equal(72, @text.word_count)
  end

  def teardown
    @file.close
    puts "The file has been closed: #{@file.closed?}"
  end
end