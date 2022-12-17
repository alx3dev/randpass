# frozen_string_literal: true

require_relative 'randpass/version'
require_relative 'randpass/random'
require_relative 'randpass/storage'

module Randpass

  class << self

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


    def nosave?
      @save == false
    end


    def nosave!
      @save = false
    end
  end
end
