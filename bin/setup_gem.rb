# frozen_string_literal: true

# Helper module for gem installation
module UserOS
  GEM_ROOT = File.expand_path(__FILE__).gsub('/bin/setup_gem.rb', '')

  class << self
    def windows?
      (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    end

    def mac?
      (/darwin/ =~ RUBY_PLATFORM) != nil
    end

    def linux?
      !windows? && !mac?
    end

    # Call setup script based on user OS, if randpass is not installed
    def gem_init
      if windows?
        dir = File.expand_path(__FILE__).gsub('\bin\setup_gem.rb', '')
        system("bundle install")
      else
        dir = File.expand_path(__FILE__).gsub('/bin/setup_gem.rb', '')
        Dir.chdir(dir)
        mac? ? system("bundle install") : system("bin/setup")
      end
    end
  end
end
