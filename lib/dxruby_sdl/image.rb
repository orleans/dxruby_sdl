# -*- coding: utf-8 -*-

module DXRubySDL
  class Image
    include Color

    attr_reader :width
    attr_reader :height
    attr_reader :_surface

    def initialize(width, height, color = [0, 0, 0, 0])
      @width = width
      @height = height
      @color = color

      @_surface =
        SDL::Surface.new(SDL::SWSURFACE, width, height, Window._screen)
      @_surface.fill_rect(0, 0, width, height, @color)
    end

    def line(x1, y1, x2, y2, color)
      @_surface.draw_line(x1, y1, x2, y2,
                          to_sdl_color(color), true, to_sdl_alpha(color))
    end
  end
end
