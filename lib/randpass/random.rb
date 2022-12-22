# frozen_string_literal: true

require 'securerandom'

module Randpass
  # Allowed specials (xxx is just a skip-flag)
  ARRAY = %w[! # * $ % _ @ xxx].freeze

  class << self
    # Generate random password
    #
    # @param  [Integer] chars_no Optional. Number of password characters. Default: 25.
    # @return [String]
    #
    def randpass(chars_no = nil)

      chars_no = 25 if [nil, 0, 1].include?(chars_no)

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
