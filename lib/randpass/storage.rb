# frozen_string_literal: true

require 'tempfile'
require 'fileutils'

module Randpass

  class << self

    attr_accessor :path

    FILE_PATH = File.expand_path(__FILE__).gsub('/lib/randpass/storage.rb', '')

    # Add password to file
    # @param [String] pass **Required**. Add password to list
    # @param [String] comm Optional. Comment to write with password
    #
    def add(pass, comm = nil)
      storage_init unless @initialized
      @temp << "#{comm}: " unless comm.nil?
      @temp << pass
      @temp << "\n"
    end
    
    # Write list as .txt file
    def finalize
      File.write "#{@path}/randpass_#{Time.now.to_i}.txt", @temp
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
      storage_init unless initialized?

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

    def storage_init
      @path ||= FILE_PATH
      Dir.chdir @path
      @temp = String.new
      @initialized = true
    end

    alias :init_storage :storage_init
  end
end