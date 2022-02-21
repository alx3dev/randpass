# frozen_string_literal: true

require 'securerandom'

# Generate random password with SecureRandom#base64 and a few
# random special characters. Method #randpass is defined as
# class and instance method, so you can call it or include it.
#
# @note Always shuffle #base64 if it has less than 16 chars, because they end with '=='
#
module Randpass
  #
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

    # rubocop:disable Metrics/MethodLength
    def add_special_chars(param)
      # bigger number than options - we don't want
      # same number of special chars each time
      count = SecureRandom.random_number 15_000

      char = case count
             when 1...1000    then '_'
             when 1000...2000 then '!'
             when 2000...3000 then '#'
             when 3000...4000 then '$'
             when 4000...5000 then '%'
             when 6000...7000 then '?'
             else return param
             end

      param[rand(param.size)] = char
      param
    end
    # rubocop:enable Metrics/MethodLength
  end
end
