require "./opaquecontainer"

module NEStley
  class Button < BorderedContainer
    def initialize(@width, @height, @x = 0, @y = 0, @background_color = 0xaaaa00)
      super(@width, @height, @x, @y, @background_color, NEStley::Color::DARK.value, false)
      @entities << Rect.new(@width - 16, @height - 16, 8, 8, @background_color)
      @entities << Rect.new(@width - 16, 8_u32, 8, @height.to_i32 - 16, (@background_color & 0xfefefe) >> 1)
      @entities << Rect.new(8_u32, @height - 16, @width.to_i32 - 16, 8, (@background_color & 0xfefefe) >> 1)
    end
  end
end
