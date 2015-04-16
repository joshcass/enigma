gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_can_encrypt_a_message
    result = Enigma.new("try ", "41521", "020315")
    assert_equal "48ax", result.encrypt
  end

  def test_it_can_decrypt_a_message
    result = Enigma.new("48ax", "41521", "020315")
    assert_equal "try ", result.decrypt
  end

  def test_it_can_encrypt_a_longer_message
    result = Enigma.new("hello world", "41521", "020315")
    assert_equal "sv0.zo.b22s", result.encrypt
  end

  def test_it_can_decrypt_a_longer_message
    result = Enigma.new("sv0.zo.b22s", "41521", "020315")
    assert_equal "hello world", result.decrypt
  end

  def test_it_can_encrypt_the_first_chapter_of_the_brothers_kramazov
    book = File.open("./test/test_message.txt", "r")
    crypt = File.open("./test/test_encrypted.txt", "r")
    message = book.read.chomp.downcase
    encrypted = crypt.read.chomp
    result = Enigma.new(message, "58876", "150415")
    assert_equal encrypted, result.encrypt
  end

  def test_test_it_can_decrypt_the_first_chapter_of_the_brothers_kramazov
    book = File.open("./test/test_message.txt", "r")
    crypt = File.open("./test/test_encrypted.txt", "r")
    message = book.read.chomp.downcase
    encrypted = crypt.read.chomp
    result = Enigma.new(encrypted, "58876", "150415")
    assert_equal message, result.decrypt
  end
end
