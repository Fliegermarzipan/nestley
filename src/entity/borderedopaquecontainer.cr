require "./opaquecontainer"

module NEStley
  class BorderedOpaqueContainer < OpaqueContainer
    def initialize(@width, @height, @x = 0, @y = 0, @background_color = 0xaaaa00, @border_color = 0xaaaa00, rounded = true)
      super(@width, @height, @x, @y, @background_color)
      @entities << Border.new(@width, @height, 0, 0, @border_color, rounded)
    end
  end
end
