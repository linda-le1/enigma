require_relative 'test_helper'
require './lib/key_generator'
require './lib/decrypt'

class DecryptionTest < Minitest::Test

  def test_it_exists
    decryption = Decryption.new
    assert_instance_of Decryption, decryption
  end

  def test_it_decrypts
    decryption = Decryption.new
    decryption.get_message_indexes("liqrs")
    decryption.set_shifts(["2", "1", "1", "1"], ["2", "3", "4", "5"])
    assert_equal "hello", decryption.decrypt_message
  end
  
end
