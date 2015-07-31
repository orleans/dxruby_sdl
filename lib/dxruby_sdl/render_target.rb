# -*- coding: utf-8 -*-

require 'forwardable'

module DXRubySDL
  class RenderTarget
    extend Forwardable

    attr_reader :_surface

    def initialize(width, height, color)
      @image = Image.new(width, height, color)
      @_surface = @image._surface
    end
    
    def draw_font(x, y, string, font, option = {})
      color = option[:color] || [255, 255, 255]
      @image.drawFont(x, y, string, font, color) 
    end

    def_delegators :@image, :draw
    alias_method :drawFont, :draw_font
  end

end
