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
      if system('bin/randpass --version')
        puts 'was found on the system'
        return
      end
      Dir.chdir GEM_ROOT
      linux? ? system('bin/setup') : system('bundle install')
    end
  end
end
