# frozen_string_literal: true

require 'tempfile'
require 'fileutils'

#
# Under Development !!!
#
module Randpass

  class << self

    attr_accessor :path

    FILE_PATH = File.expand_path(__FILE__).gsub('/lib/randpass/storage.rb', '')

    def initialized?; @initialized == true end


    def storage_init
      @path ||= FILE_PATH
      Dir.chdir @path
      @temp = String.new
      @initialized = true
    end

    alias :init_storage :storage_init


    def add(pass, comm = nil)
      storage_init unless @initialized
      @temp << "#{comm}: " unless comm.nil?
      @temp << pass
      @temp << "\n"
    end
    

    def finalize
      File.write "#{@path}/randpass_#{Time.now.to_i}.txt", @temp
      @initialized = false
    end


    def generate_list(chars_no = nil, opts = {list: 10})
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

    
    def storage
      @temp
    end
  end
end