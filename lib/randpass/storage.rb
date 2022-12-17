# frozen_string_literal: true

require 'fileutils'

module Randpass

  class << self

    attr_accessor :path

    FILE_PATH = File.expand_path(__FILE__).gsub('/lib/randpass/storage.rb', '')

    # Add password to list
    # @param [String] pass **Required**. Add password to list
    # @param [String] comm Optional. Comment to write with password
    #
    def add(pass, comm = nil)
      reload unless @initialized
      line = comm.nil? ? pass : "#{comm}: #{pass}"
      @temp << line
    end
    
    # Write list as .txt file
    def finalize
      unless Randpass.nosave?
        File.write "#{@path}/randpass_#{Time.now.to_i}.txt", @temp.join("\n")
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

    def reload
      @path ||= FILE_PATH
      Dir.chdir(@path)
      @temp = Array.new
      @initialized = true
    end


    private

    def initialized?; @initialized == true end

  end
end
