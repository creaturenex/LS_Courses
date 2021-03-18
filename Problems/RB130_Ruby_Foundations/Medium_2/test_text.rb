require 'minitest/autorun'
require 'minitest/pride'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @text_file = File.open('sample_text.txt', "r")
    # this can be written with the block { |file| file.read }, when the method exits the block it will automatically close the file.
  end

  def teardown
    @text_file.close
    puts "File has been closed: #{@text_file.closed?}"
  end

  def test_swap
    text = Text.new(@text_file.read)
    actual_text = text.swap("a","e")

    expected_text = <<~TEXT
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    assert_equal expected_text, actual_text
  end

  def test_word_count
    text = Text.new(@text_file.read)

    expected_text = <<~TEXT
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    assert_equal expected_text.split.count, text.word_count
  end
end
