# frozen_string_literal: true

require_relative 'randpass/version'
require_relative 'randpass/random'
require_relative 'randpass/storage'

# Generate random password with SecureRandom#base64 and a few
# special characters.
#
module Randpass

  class << self

    # Check if password(s) will be copied to clipboard
    def nocopy?
      @copy == false
    end

    # Disable password(s) copy (affect only executable)
    def nocopy!
      @copy = false
    end

    # Check if password(s) will be printed to STDOUT
    def noprint?
      @output == false
    end

    # Do not print password(s) to STDOUT (affect only executable)
    def noprint!
      @output = false
    end

    # Check if password list will be saved as txt file.
    def nosave?
      @save == false
    end

    # Do not save password list as txt file.
    def nosave!
      @save = false
    end
  end
end
