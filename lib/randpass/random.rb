# frozen_string_literal: true

require 'securerandom'

# Generate random password with SecureRandom#base64 and a few
# random special characters. Method #randpass is defined as
# class and instance method, so you can call it or include it.
#
module Randpass
  # Allowed specials. xxx is just a flag for #add_special_chars
  ARRAY = %w[! # * $ % _ @ xxx].freeze

  # Random number of times try to add random special character.
  # Transform to array, shuffle, and join back to string.
  #
  # Provide number of characters for password as argument,
  # default value is **25**.
  #
  # @param [Integer] number_of_chars Optional. Number of password characters.
  # @return [String]
  #
  def randpass(number_of_chars = nil)
    Randpass[number_of_chars]
  end

  class << self
    # @return [String]
    def randpass(chars_no = nil)
      chars_no = 25 if (chars_no.nil? || chars_no == 0)
      # slice string made with base64, to number of characters we want
      param = SecureRandom.base64(chars_no)[0...chars_no]

      rand(param.size / 2).times do
        param = add_special_characters(param)
      end

      param.split('').shuffle.join
    end

    alias [] randpass

    private

    def add_special_characters(param)
      char = ARRAY.shuffle[rand(ARRAY.size)]
      return param if char == 'xxx'

      param[rand(param.size)] = char.to_s
      param
    end
  end
end
