# frozen_string_literal: true

require 'tempfile'
require 'fileutils'

#
# Under Development !!!
#
module Randpass

  class << self

    attr_reader :storage, :path

    def initialized?; @initialized == true end

    
    def storage_init(path = nil)

      if path.nil?
        @path = File.expand_path(__FILE__).gsub('/lib/randpass/storage.rb', '')
      else
        @path = path
      end

      Dir.chdir @path

      @temp = Tempfile.new ["randpass", '.storage']

      @initialized = true
    end

    alias :init_storage :storage_init


    def add(pass, comm = nil)
      storage_init unless @initialized
      @temp.print("#{comm}: ") unless comm.nil?
      @temp.puts pass
    end
    

    def finalize
      @temp.close
      File.rename @temp, "#{@path}/main_storage/randpass_#{Time.now.to_i}.txt"
      @temp.unlink
      @initialized = false
    end


    def generate_list(chars_no = nil, opts = {comments: [], list: 10})

      storage_init unless initialized?

      if opts[:comments].empty?
        opts[:list].times do
          add Randpass[chars_no]
        end
      else
        opts[:comments].select do |com|
          add Randpass[chars_no], com
        end
      end

      Randpass.finalize
    end
  end
end