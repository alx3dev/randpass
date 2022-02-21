# frozen_string_literal: true

require 'securerandom'

# Generate random password with SecureRandom#base64 and a few
# random special characters. Method #randpass is defined as
# class and instance method, so you can call it or include it.
#
# @note Always shuffle #base64 if it has less than 16 chars, because they end with '=='
#
module Randpass
  # allowed specials. xxx is flag for #add_special_chars
  ARRAY = %w[! # * $ % _ @ xxx].freeze

  # Random number of times try to add random special character.
  # Transform to array, shuffle, and join back to string
  #
  # @param [Integer] number_of_chars **Required**. Number of password characters.
  # @return [String]
  #
  def randpass(number_of_chars)
    Randpass[number_of_chars]
  end

  class << self
    # @return [String]
    def randpass(number_of_chars)
      param = SecureRandom.base64(number_of_chars)
      rand(5..10).times do
        param = add_special_chars(param)
      end
      param.split('').shuffle.join
    end

    alias [] randpass

    private

    def add_special_chars(param)
      char  = ARRAY.shuffle[rand(ARRAY.size)]
      return param if char == 'xxx'
      param[rand(param.size)] = char.to_s
      param
    end
  end
end
