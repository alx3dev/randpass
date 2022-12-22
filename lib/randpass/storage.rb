# frozen_string_literal: true

require 'fileutils'

module Randpass

  class << self

    attr_accessor :path

    # Add password to list
    # @param [String] pass **Required**. Password
    # @param [String] comm Optional. Password comment
    #
    def add(pass, comm = nil)
      reload unless @initialized
      line = comm.nil? ? pass : "#{comm}: #{pass}"
      @temp << line
    end

    # Clear old password list
    def reload
      @path ||= Dir.pwd
      @temp = Array.new
      @initialized = true
    end

    # Save list of passwords as txt file
    def finalize
      unless Randpass.nosave?
        temp = @temp.join "\n"
        @path += '/' unless @path.end_with?('/')
        File.write "#{@path}randpass_#{Time.now.to_i}.txt", temp
      end
      @initialized = false
    end

    # Generate list of passwords, and save as plain txt.
    #
    # @param [Integer] chars_no **Required**. Number of password characters.
    # @param [Hash] opts Optional. Options hash.
    #
    # @option opts [String] comment Add comment (name) with password.
    # @option opts [Integer] list Number of passwords to generate (if no comments)
    #
    def generate_list(chars_no, opts = {list: 10})
      if opts[:comments].nil?
        opts[:list].times do
          add Randpass[chars_no]
        end
      else
        opts[:comments].each do |com|
          add Randpass[chars_no], com
        end
      end

      Randpass.finalize
    end

    # Access password list
    def storage
      @temp
    end


    private

    def initialized?; @initialized == true end

  end
end
