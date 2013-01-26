module Spiel
  require 'singleton'

  class Just
    def initialize(object)
      @object = object
    end

    def method_missing(meth, *args, &block)
      Maybe(@object.send(meth, *args, &block))
    end

    def get_or_else(value)
      @object
    end
  end

  class NothingClass
    include Singleton

    def method_missing(meth, *args, &block)
      Nothing
    end

    def get_or_else(value)
      value
    end

    def nil?
      true
    end

    def to_s
      "Nothing"
    end

  end

  # only one Nothing in the system, saving resources FTW
  Nothing = NothingClass.instance
end

def Maybe(object)
  object.nil? ? Spiel::Nothing : Spiel::Just.new(object)
end

