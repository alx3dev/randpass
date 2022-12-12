# frozen_string_literal: true

require_relative 'randpass/version'
require_relative 'randpass/random'

require 'clipboard'

module Randpass  
  class << self
    @output = true
    @copy = true

    def nocopy?
      @copy == false
    end

    def nocopy!
      @copy = false
    end

    def noprint?
      @output == false
    end

    def noprint!
      @output = false
    end
  end
end